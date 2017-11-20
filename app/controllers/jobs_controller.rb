class JobsController < ApplicationController

 	def index
  	@joblist = Job.where(id: ApplicationScore.where(ascore: 4).pluck(:originaljob_id).compact.first(50))
  end


 	def show
   	@job = Job.find(params[:id])
   	session[:job_id] = params[:id]
    @skill = @job.Skills.pluck(:name)

 #------For Job Recommendation-------------

   	@jobshow = params[:id]
   	@skill_score =
   	if current_member == nil
   	SkillScore.where(originaljob_id: @jobshow).pluck(:job_id, :sscore).map { |job_id, score| {job_id: job_id, score: score}}
   	else
		SkillScore.where(user_id: User.find_by(email: current_member.email).id).pluck(:job_id, :sscore).map { |job_id, score| {job_id: job_id, score: score}}
		end
   	@consolidated_rec =
   	ApplicationScore.where(originaljob_id: @jobshow).pluck(:job_id, :ascore).map { |job_id, score| {job_id: job_id, score: score}} + BookmarkScore.where(originaljob_id: @jobshow).pluck(:job_id, :bscore).map { |job_id, score| {job_id: job_id, score: score}} + CategoryScore.where(originaljob_id: @jobshow).pluck(:job_id, :cscore).map { |job_id, score| {job_id: job_id, score: score}} + @skill_score

		@count_rec = @consolidated_rec.inject(Hash.new(0)) do |sums, hash|
		sums[hash[:job_id]] += hash[:score]
		sums
		end

		@sorted_rec = @count_rec.sort_by{ |job_id, score| score }.reverse
		# Displays 5 recommended jobs
		@final_rec_id = @sorted_rec.sort_by{ |job_id, score| score }.reverse.collect(&:first).first(5)
		@final_rec_jobs = Job.where(id: @final_rec_id)
#---------For User Record Creation ----------
		if member_signed_in?

			@sorted_rec.first(5).each do |records|

				rec_id = records[0]
				score = records[1]
				Record.delay.create(user_id: User.find_by(email: current_member.email).id, job_id: @jobshow, jobrec_id: rec_id, savedscore: score)
			end
		end
		render "show"
	end


	def create
		# We needed to get the apply button working in order to display the user logs in the admin#index page. 
		# The code below does 2 things:
		# 1. Creates an application (after the implementation of the recommendation engine) 
		application = Application.create(note: "testing", ApplicantId: User.find_by(email: current_member.email).id, JobId: session[:job_id], attachments: nil, status: "NEW", createdAt: Time.now, updatedAt: Time.now)
		if application.save
		# 2. In line 53-55, it creates rows in the records table recording every recommendation that a user has been served.
		@find_record = Record.find_by(user_id: User.find_by(email: current_member.email).id, jobrec_id: session[:job_id])
		@find_record[:applicant_id] = application.id
		@find_record.save
		end

	end




end
