class GenerateCategoryScoreService

	def call

		job = Job.where(id: ApplicationScore.all.pluck(:originaljob_id).uniq).limit(100)
	  #@job = Job.find(params[:id])

	  job.find_each(batch_size: 10) do |x|
	    generate_scores_for_one_job(x)
	  end
	end

	private

	def generate_scores_for_one_job(job)
		@jobcategory = job.JobCategoryId

    array_of_jobid = ApplicationScore.where(originaljob_id: job.id).pluck(:job_id)
    array_of_jobcategoryid= Job.where(id: array_of_jobid).pluck(:JobCategoryId)

    array_of_jobid_and_categoryid = array_of_jobid.zip(array_of_jobcategoryid).flatten.compact
    array_of_jobid_and_categoryid = array_of_jobid_and_categoryid .each_slice(2).to_a

    array_of_jobid_and_categoryid.each do |t|
      if @jobcategory == t[1]
        matched_count =1
      else
        matched_count =0
      end

      matched_category_score = matched_count*0.5
      t.insert(2, matched_category_score)
    end
#[1, 5, 0.5]
    array_of_jobid_and_categoryid.each do |catscore|


        jobid = catscore[0]
        score = catscore[2]
        originaljob = job.id

        unless score == 0.0
        CategoryScore.create( originaljob_id: originaljob, job_id: jobid, cscore: score)
      	end
    end


	end





end