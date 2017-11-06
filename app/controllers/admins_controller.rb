class AdminsController < ApplicationController

	def index


	end


	def create

		# A Variable ----------------------------------------------------------------

#GenerateApplicationScoreService.new.call
			# if @asave.save
			# 	flash[:notice] = "Applications Score Saved Successfully"
			# else
			# 	@asave.errors.full_messages
			# end
	 			# @recapplicationjobs = Job.where(id: ApplicationScore.where(originaljob_id: params[:id]).pluck(:job_id))

		# B Variable ----------------------------------------------------------------

#GenerateBookmarkScoreService.new.call
	   # 	@bjob = Job.all.where(status: "OPEN").limit(100)

	   # 	@bjob.find_each(batch_size: 10) do |eachjob|

		  #  	@busers = eachjob.busers
		  #  	next unless @busers.present?
		  #  	@bjobsnum = []
		  #  	@busers.each_with_index do |user, i|

		  #  		@bjobslist = []
		  #  		@bjobslist += user.bjobs.where(status: "OPEN")
		  #  		@bjobsnum[i] = []
		  #     @bjobsnum[i] << @bjobslist.map { |job| job if job[:id] != params[:id].to_i }.compact.pluck(:id)
				# end
		  #  	@bjobsnum = @bjobsnum.flatten
	 		# 	@bjobsnumcount = @bjobsnum.each_with_object(Hash.new(0)) { |job_id,score| score[job_id] = 1*3 }
	 		# 	@bsort = @bjobsnumcount.sort_by {|k,v| v}.reverse

	 		# 	@blimitsort = @bsort.first(10)
	 		# 	@blimitsort.each do |jobscore|

	 		# 		jobid = jobscore[0]
	 		# 		score = jobscore[1]
	 		# 		originaljob = eachjob.id


	 		# 		@bsave = BookmarkScore.create(originaljob_id: eachjob.id, job_id: jobid, bscore: score)

	 		# 	end
	 		# end

 		# C Variable ----------------------------------------------------------------
#GenerateCategoryScoreService.new.call
 		# 	job = Job.where(id: ApplicationScore.all.pluck(:originaljob_id).uniq)
	  #   #@job = Job.find(params[:id])

	  #   job.each do |x|
	  #     @jobcategory = x.JobCategoryId

	  #     array_of_jobid = ApplicationScore.where(originaljob_id: x.id).pluck(:job_id)
	  #     array_of_jobcategoryid= Job.where(id: array_of_jobid).pluck(:JobCategoryId)

	  #     array_of_jobid_and_categoryid = array_of_jobid.zip(array_of_jobcategoryid).flatten.compact
	  #     array_of_jobid_and_categoryid = array_of_jobid_and_categoryid .each_slice(2).to_a

	  #     array_of_jobid_and_categoryid.each do |t|
	  #       if @jobcategory == t[1]
	  #         matched_count =1
	  #       else
	  #         matched_count =0
	  #       end

	  #       matched_category_score = matched_count*0.5
	  #       t.insert(2, matched_category_score)
	  #     end
	  # #[1, 5, 0.5]
	  #       array_of_jobid_and_categoryid.each do |catscore|


	  #           jobid = catscore[0]
	  #           score = catscore[2]
	  #           originaljob = x.id

	  #           unless score == 0.0
	  #           CategoryScore.create( originaljob_id: originaljob, job_id: jobid, cscore: score)
	  #         	end
	  #       end
	  #   end

	    # S Variable ----------------------------------------------------------------
	    GenerateSkillScoreService.new.call
	    #  if @userpresent = current_member.present?

			# 	@user = User.find_by(email: current_member.email)
	# 		@user = User.all.where(role: "CANDIDATE").first(2) #remove first(2)
	# 		@user.each do |eachuser|

	# 	    @skill = eachuser.Skills.pluck(:id)
	# 	    all_job = Job.first(50) #change to Job.all.where(status: "OPEN")
	# 	    #all_job = Job.first(100).where(status: "OPEN")
	# 	    array_of_skills = []
	# 	    array_of_jobid=[]
	# 	    all_job.each do |getarray|
	# 	      allarray= getarray.Skills.pluck(:id)
	# 	      array_of_skills << allarray

	# 	    end

	# 	    a = all_job.pluck(:id)
	# 	    array_of_skills.each.with_index(1) { |e,i| a.insert((2*i)-1,e) }
	# 	    a.each_slice(2).to_a
	# 	    b=a.each_slice(2).to_a

	# 	    b.each do |t|
	# 	      matched_skills = @skill & t[1]
	# 				matched_count = matched_skills.count
	# 			  if matched_count ==  0.0
	# 					matched_count = nil
	# 				else    #address this
	# 					t.insert(2, matched_count)
	# 				end
	# 			end

	# 	    top_5_matches_full = b.each.max_by(6){|i| i[2]}

	# 	    top_5_matches_full.each do |k|
	# 	      top_5_matches_jobid_only = [k[0]]

	# 	    end

	# 	    @acurretskillsize= @skill.size


	# 	    top_5_matches_full.each do |k|
	# 	      match =k[2]
	# 	      y= (match.to_f/@acurretskillsize.to_f)*5
	# 	      k.insert(3, y)
	# 	    end

	# 	    top_5_matches_full.shift

	# 	    top_5_matches_full.each do |jobscore|

	# 	        userid = eachuser.id
	# 	        jobid = jobscore[0]
	# 	        score = jobscore[3]
	# 	        originaljob = nil

	# 	        unless score.nan?
	# 	        	SkillScore.create(user_id: userid, originaljob_id: originaljob, job_id: jobid, sscore: score)
	# 	      	end
	# 	    end
	# 		end

	# ########
	#   #else
	# ########
	#     job = Job.all.where(status: "OPEN").first(1) #remove first(1)
	# 		job.each do |x|

	# 	    @skill = x.Skills.pluck(:id)
	# 	    a = Job.all.where(status: "OPEN").first(50).pluck(:id) # remove first(50)
	# 	    #all_job = Job.first(100).where(status: "OPEN")
	# 	    array_of_skills = []
	# 	    array_of_jobid=[]

	# 			Job.where(id: a).each do |getarray|
	# 	      allarray= getarray.Skills.pluck(:id)
	# 	      array_of_skills << allarray
	# 	    end

	# 	    # a = all_job.pluck(:id)
	# 	    array_of_skills.each.with_index(1) { |e,i| a.insert((2*i)-1,e) }
	# 	    a.each_slice(2).to_a
	# 	    b=a.each_slice(2).to_a

	# 	    b.each do |t|
	# 	      matched_skills = @skill & t[1]
	# 	      matched_count = matched_skills.count
	# 	      t.insert(2, matched_count)
	# 	    end

	# 	    top_5_matches_full = b.each.max_by(6){|i| i[2]}

	# 	    top_5_matches_full.each do |k|
	# 	      top_5_matches_jobid_only = [k[0]]
	# 	    end

	# 	    @acurretskillsize= @skill.size


	# 	    top_5_matches_full.each do |k|
	# 	      match =k[2]
	# 	      y= (match.to_f/@acurretskillsize.to_f)*5
	# 	      k.insert(3, y)
	# 	    end

	# 		  top_5_matches_full.shift
	# 			top_5_matches_full.each do |jobscore|

	# 	        userid = nil
	# 	        jobid = jobscore[0]
	# 	        score = jobscore[3]
	# 	        originaljob = x.id

	# 	        SkillScore.create(user_id: userid, originaljob_id: originaljob, job_id: jobid, sscore: score)
	# 	    end
	# 		end




		redirect_to admins_path
	end




end
