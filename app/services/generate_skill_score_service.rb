class GenerateSkillScoreService

	def call
		@user = User.all.where(role: "CANDIDATE").limit(50) #remove first(2)
		
		@user.find_each(batch_size: 10) do |eachuser|
	    generate_user_skill_score(eachuser)
		end

	########
	#else
	########
	  job = Job.all.where(createdAt: 60.days.ago..Time.now, status: "OPEN").order(createdAt: :desc).limit(50) #remove first(1)
		job.find_each(batch_size: 10) do |x|
			generate_job_skill_score(x) 
		end
	end

	private

	def generate_user_skill_score(user)
		@skill = user.Skills.pluck(:id)
    # all_job = Job.all.where(status: "OPEN").limit(50)
    all_job = Job.all.where(createdAt: 30.days.ago..Time.now, status: "OPEN").order(createdAt: :desc)
    array_of_skills = []
    array_of_jobid=[]
    all_job.find_each(batch_size: 10) do |getarray|
      allarray= getarray.Skills.pluck(:id)
      array_of_skills << allarray

    end

    a = all_job.pluck(:id)
    array_of_skills.each.with_index(1) { |e,i| a.insert((2*i)-1,e) }
    a.each_slice(2).to_a
    b=a.each_slice(2).to_a

    b.each do |t|
      matched_skills = @skill & t[1]
			matched_count = matched_skills.count
		  if matched_count ==  0.0
				matched_count = nil
			else    #address this
				t.insert(2, matched_count)
			end
		end

    top_5_matches_full = b.each.max_by(6){|i| i[2] || 0.0 }

    top_5_matches_full.each do |k|
      top_5_matches_jobid_only = [k[0]]

    end

    @acurretskillsize= @skill.size


    top_5_matches_full.each do |k|
      match =k[2]
      y= (match.to_f/@acurretskillsize.to_f)*5
      k.insert(3, y)
    end

    top_5_matches_full.shift

    top_5_matches_full.each do |jobscore|

        userid = user.id
        jobid = jobscore[0]
        score = jobscore[3]
        originaljob = nil

        if !score.nan? && score != 0.0
        	SkillScore.create(
        		user_id: userid, 
        		originaljob_id: originaljob, 
        		job_id: jobid, 
        		sscore: score
        		)
      	end
      	
    end
	end

	def generate_job_skill_score(job)
		@skill = job.Skills.pluck(:id)
    # a = Job.all.where(status: "OPEN").limit(50).pluck(:id) # remove first(50)
    a = Job.all.where(createdAt: 30.days.ago..Time.now, status: "OPEN").order(createdAt: :desc).pluck(:id)
    array_of_skills = []
    array_of_jobid=[]

		Job.where(id: a).find_each(batch_size: 10) do |getarray|
      allarray= getarray.Skills.pluck(:id)
      array_of_skills << allarray
    end

    # a = all_job.pluck(:id)
    array_of_skills.each.with_index(1) { |e,i| a.insert((2*i)-1,e) }
    a.each_slice(2).to_a
    b=a.each_slice(2).to_a

    b.each do |t|
      matched_skills = @skill & t[1]
      matched_count = matched_skills.count
      t.insert(2, matched_count)
    end

    top_5_matches_full = b.each.max_by(6){|i| i[2]}

    top_5_matches_full.each do |k|
      top_5_matches_jobid_only = [k[0]]
    end

    @acurretskillsize = @skill.size


    top_5_matches_full.each do |k|
      match =k[2]
      y= (match.to_f/@acurretskillsize.to_f)*5
      k.insert(3, y)
    end

	  top_5_matches_full.shift
		top_5_matches_full.each do |jobscore|

        userid = nil
        jobid = jobscore[0]
        score = jobscore[3] # 0.0, nan
        originaljob = job.id

        if !score.nan? && score != 0.0
	        SkillScore.create(
	        	user_id: userid, 
	        	originaljob_id: originaljob, 
	        	job_id: jobid, 
	        	sscore: score
	        	)
	    	end
    end
	end


end