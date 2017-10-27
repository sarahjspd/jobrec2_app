class JobsController < ApplicationController

	def index
		@joblist = Job.limit(10)
	end

	def show
		# B Variable
    @job = Job.find(params[:id])
  	@users = @job.busers
  	@users.each do |user|
  		@bjobslist = []
  		@bjobslist += user.bjobs
  	end

  	# A Variable
  	@job = Job.find(params[:id])
  	@users = @job.ausers
  	@users.each do |user|
  		@ajobslist = []
  		@ajobslist += user.ajobs
  		# @jobsnum = @ajobslist.pluck(:id)

  		@jobsnum = @ajobslist.map { |job| job if job[:id] != params[:id].to_i }.compact.pluck(:id)
			@jobsnumcount = @jobsnum.each_with_object(Hash.new(0)) { |job_id,score| score[job_id] += 1*4 } 
			@sort = @jobsnumcount.sort_by {|k,v| v}.reverse

			@jobid = @sort.map { |a| a[0] }


			@limitsort = @sort.first(50)
byebug
			@limitsort.each do |jobscore|

				application = Application.where(JobId: jobscore[0], ApplicantId: user.id).last
				jobid = jobscore[0]
				score = jobscore[1]


				ApplicationScore.create(application_id: application.id, job_id: jobid, ascore: score)
			end

	  		@ajobsapplicationcount = []
	  		@ajobsapplicationcount += user.Applications
	  		@applicationscoretable = ApplicationScore.all
	  end


  end
 

end
