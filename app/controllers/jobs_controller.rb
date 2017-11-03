class JobsController < ApplicationController
  
 	def index

 	end
  
 	def show  
 
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

	@final_rec_id = @sorted_rec.sort_by{ |job_id, score| score }.reverse.collect(&:first).first(5)

	@final_rec_jobs = Job.where(id: @final_rec_id)
#--------------------------------------------
	end


 

end