class GenerateCategoryScoreService

	def call

		job = Job.where(id: ApplicationScore.all.pluck(:originaljob_id).uniq)
    bookmark_job = Job.where(id: BookmarkScore.all.pluck(:originaljob_id).uniq)

	  job.find_each do |x|
	    generate_scores_for_one_job(x)
	  end

    bookmark_job.find_each do |y|
      generate_scores_for_one_bookmark_job(y)
    end
	end

	private

	def generate_scores_for_one_job(job)
    
		@jobcategory = job.JobCategoryId

    array_of_jobid = ApplicationScore.where(originaljob_id: job.id).pluck(:job_id)
    array_of_jobcategoryid= Job.where(id: array_of_jobid).pluck(:JobCategoryId)

    array_of_jobid_and_categoryid = array_of_jobid.zip(array_of_jobcategoryid).flatten.compact
    array_of_jobid_and_categoryid = array_of_jobid_and_categoryid.each_slice(2).to_a

    array_of_jobid_and_categoryid.each do |t|
      if @jobcategory == t[1]
        matched_count =1
      else
        matched_count =0
      end
      # The number 0.5 below is the multiplier based on the importance of the Job Category Variable in the User journey, can be changed.
      matched_category_score = matched_count*0.5
      t.insert(2, matched_category_score)
    end
    array_of_jobid_and_categoryid.each do |catscore|

        jobid = catscore[0]
        score = catscore[2]
        originaljob = job.id

        unless score == 0.0
        CategoryScore.create( originaljob_id: originaljob, job_id: jobid, cscore: score)
      	end
    end
	end

  def generate_scores_for_one_bookmark_job(job)
    @jobcategory = job.JobCategoryId

    array_of_jobid = BookmarkScore.where(originaljob_id: job.id).pluck(:job_id)
    array_of_jobcategoryid= Job.where(id: array_of_jobid).pluck(:JobCategoryId)

    array_of_jobid_and_categoryid = array_of_jobid.zip(array_of_jobcategoryid).flatten.compact
    array_of_jobid_and_categoryid = array_of_jobid_and_categoryid.each_slice(2).to_a

    array_of_jobid_and_categoryid.each do |t|
      if @jobcategory == t[1]
        matched_count =1
      else
        matched_count =0
      end
      # The number 0.5 below is the multiplier based on the importance of the Job Category Variable in the User journey, can be changed.
      matched_category_score = matched_count*0.5
      t.insert(2, matched_category_score)
    end
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