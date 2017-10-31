class JobsController < ApplicationController
  
 	def index
 		@joblist = Job.limit(100)

 	end
  
 	def show  
 
   	# A Variable
   	
   	# @job = Job.find(params[:id])
   	@job = Job.all.where(status: "OPEN").first(3)   	
   	
   	@job.each do |job|

	   	@users = job.ausers
	   		@jobsnum = []
	   	@users.each_with_index do |user, i|

	   		@ajobslist = []
	   		@ajobslist += user.ajobs.where(status: "OPEN")
	   		@jobsnum[i] = []
	      @jobsnum[i] << @ajobslist.map { |job| job if job[:id] != params[:id].to_i }.compact.pluck(:id)
		 	end
	   		@jobsnum = @jobsnum.flatten
	 			@jobsnumcount = @jobsnum.each_with_object(Hash.new(0)) { |job_id,score| score[job_id] = 1*4 } 
	 			@sort = @jobsnumcount.sort_by {|k,v| v}.reverse 
	 
	 			@limitsort = @sort.first(10)
	 			@limitsort.each do |jobscore|
	 
	 				jobid = jobscore[0]
	 				score = jobscore[1]
	 				originaljob = params[:id].to_i
	 
	 
	 				ApplicationScore.create(originaljob_id: originaljob, job_id: jobid, ascore: score)
	 			end
	 	end
	 			@recapplicationjobs = Job.where(id: ApplicationScore.where(originaljob_id: params[:id]).pluck(:job_id))
		
		# B Variable
		# @bjob = Job.find(params[:id])
   	@bjob = Job.all.where(status: "OPEN").first(3)   

   	@bjob.each do |job|

	   	@busers = @bjob.busers
	   		@bjobsnum = []
	   	@busers.each_with_index do |user, i|

	   		@bjobslist = []
	   		@bjobslist += user.bjobs.where(status: "OPEN")
	   		@bjobsnum[i] = []
	      @bjobsnum[i] << @bjobslist.map { |job| job if job[:id] != params[:id].to_i }.compact.pluck(:id)
		 	end
	   		@bjobsnum = @bjobsnum.flatten
	 			@bjobsnumcount = @bjobsnum.each_with_object(Hash.new(0)) { |job_id,score| score[job_id] = 1*3 } 
	 			@bsort = @bjobsnumcount.sort_by {|k,v| v}.reverse 

	 			@blimitsort = @bsort.first(10)
	 			@blimitsort.each do |jobscore|
	 
	 				jobid = jobscore[0]
	 				score = jobscore[1]
	 				originaljob = params[:id].to_i
	 
	 
	 				BookmarkScore.create(originaljob_id: originaljob, job_id: jobid, bscore: score)
	 			end
	 	end
 			@recbookmarkjobs = Job.where(id: BookmarkScore.where(originaljob_id: params[:id]).pluck(:job_id))



	end


 

end