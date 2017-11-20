class GenerateApplicationScoreService

	def call
		# Glints to decide on the lookback window for refresh
	   	# jobs = Job.all.where(status: "OPEN", createdAt: 60.days.ago..Time.now)
	    jobs = Job.all.where(status: "OPEN")	

	   	
	   	jobs.find_each do |eachjob|
	   		generate_scores_for_one_job(eachjob)
	   	end
	end

	private

	def generate_scores_for_one_job(job)

		@jobsnum = find_related_jobs_by_application(job)

		return if @jobsnum.empty?
		
		@usersperjob = job.ausers.pluck(:id)
		@jobsnumcount = @jobsnum.uniq.each_with_object(Hash.new(0)) do |job_id,score| 
			# The number 4 below is the multiplier based on the importance of the Application Variable in the User journey, can be changed.
			score[job_id] = find_proportion_for_score(job_id, @jobsnum, @usersperjob) * 4
		end
		
		@sort = @jobsnumcount.sort_by {|k,v| v}.reverse 
		@limitsort = @sort.first(5)
		@limitsort.each do |jobscore|

			recjobid = jobscore[0]
			score = jobscore[1]
			originaljob = job.id

			@asave = ApplicationScore.create(
				originaljob_id: originaljob, 
				job_id: recjobid, 
				ascore: score
			)
		end
	end

	def find_proportion_for_score(job_id, job_ids, user_ids)

		numerator = job_ids.count(job_id).to_f
		denominator = user_ids.size.to_f
		calculation = numerator/denominator

	end

	def find_related_jobs_by_application(job)
		relevant_applications = Application.where(ApplicantId: job.ausers.select(:id))
		job_ids = relevant_applications.where.not(JobId: job.id).pluck(:JobId)
	end
end