class CategoryScoresController < ApplicationController

  def index


    job = Job.where(id: ApplicationScore.all.pluck(:originaljob_id).uniq)
    #@job = Job.find(params[:id])

    job.each do |x|
      @jobcategory = x.JobCategoryId

      array_of_jobid = ApplicationScore.where(originaljob_id: x.id).pluck(:job_id)
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
            originaljob = x.id
            CategoryScore.create( originaljob_id: originaljob, job_id: jobid, cscore: score)
        end
    end

    end

end

# def index
#
#   job = Job.where(id: ApplicationScore.all.pluck(:originaljob_id).uniq)
#   #@job = Job.find(params[:id])
#   job.each do |x|
#
#     @jobcategory = x.JobCategoryId
#
#     array_of_jobid = ApplicationScore.where(originaljob_id: x.id).pluck(:job_id)
#     # array_of_jobid= all_jobs_compared.pluck(:id)
#     array_of_jobcategoryid= all_jobs_compared.pluck(:JobCategoryId)
#
#     array_of_jobid_and_categoryid = array_of_jobid.zip(array_of_jobcategoryid).flatten.compact
#     array_of_jobid_and_categoryid = array_of_jobid_and_categoryid .each_slice(2).to_a
#
#     array_of_jobid_and_categoryid.each do |t|
#       if @jobcategory == t[1]
#         matched_count =1
#       else
#         matched_count =0
#       end
#
#       matched_category_score = matched_count*0.5
#       t.insert(2, matched_category_score)
#     end
# #[1, 5, 0.5]
#       array_of_jobid_and_categoryid.each do |catscore|
#
#
#           jobid = catscore[0]
#           score = catscore[2]
#           originaljob = Job.first[:id]
#           CategoryScore.create( originaljob_id: originaljob, job_id: jobid, cscore: score)
#       end
#
#   end
