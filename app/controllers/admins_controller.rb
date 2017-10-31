class AdminsController < ApplicationController

	def index


	end


	def create

		# A Variable
   	
   		# @job = Job.find(params[:id])
	   	@job = Job.all.where(status: "OPEN").first(1)   	
	   	
	   	@job.each do |eachjob|

		   	@users = eachjob.ausers
		   	next unless @users.present?
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
 				originaljob = eachjob.id
 
 
 				@asave = ApplicationScore.create(originaljob_id: eachjob.id, job_id: jobid, ascore: score)
 				if @asave.save
 					flash[:notice] = "Applications Score Saved Successfully"
 				else
 					@asave.errors.full_messages
 				end
 			end

	 	end
	 			# @recapplicationjobs = Job.where(id: ApplicationScore.where(originaljob_id: params[:id]).pluck(:job_id))
		
		# B Variable
		# @bjob = Job.find(params[:id])
	   	@bjob = Job.all.where(status: "OPEN").first(100)   

	   	@bjob.each do |eachjob|

		   	@busers = eachjob.busers
		   	next unless @busers.present?
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
 				originaljob = eachjob.id
 
 
 				@bsave = BookmarkScore.create(originaljob_id: eachjob.id, job_id: jobid, bscore: score)
 				if @bsave.save
 					flash[:notice] = "Bookmarks Score Saved Successfully"
 				else
 					@bsave.errors.full_messages
 				end

 			end
	 	end
 			# @recbookmarkjobs = Job.where(id: BookmarkScore.where(originaljob_id: params[:id]).pluck(:job_id))
		redirect_to admins_path
	end




end