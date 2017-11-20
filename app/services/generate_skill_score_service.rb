class GenerateSkillScoreService

	def call
    # Does User Skills Match to Potential Job through Job Skills
		# Glints to decide on the lookback window for refresh
    # @user = User.all.where(role: "CANDIDATE").limit(200)
    @user = User.all.where(role: "CANDIDATE")
		
		@user.find_each do |eachuser|
	    generate_user_skill_score(eachuser)
		end

    # Does Job Skills Match to Potential Job through Job Skills
    # Glints to decide on the lookback window for refresh
	  # job = Job.all.where(createdAt: 100.days.ago..Time.now, status: "OPEN").order(createdAt: :desc)
    job = Job.all.where(status: "OPEN")
		job.find_each do |x|
			generate_job_skill_score(x) 
		end
	end

	private

	def generate_user_skill_score(user)
		@skill = user.Skills.pluck(:id)
    # Glints to decide on the lookback window for refresh for all_job
    # all_job = Job.all.where(createdAt: 60.days.ago..Time.now, status: "OPEN").order(createdAt: :desc)
    all_job = Job.all.where(status: "OPEN")
    array_of_skills = []
    array_of_jobid=[]
    all_job.find_each do |getarray|
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
			else
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
      # The number 5 below is the multiplier based on the importance of the Skill Score Variable in the User journey, can be changed.
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
    # Glints to decide on the lookback window for refresh for a
    # a = Job.all.where(createdAt: 100.days.ago..Time.now, status: "OPEN").order(createdAt: :desc).pluck(:id)
    a = Job.all.where(status: "OPEN").pluck(:id)
    array_of_skills = []
    array_of_jobid=[]

		Job.where(id: a).find_each do |getarray|
      allarray= getarray.Skills.pluck(:id)
      array_of_skills << allarray
    end

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
      # The number 5 below is the multiplier based on the importance of the Skill Score Variable in the User journey, can be changed.
      y= (match.to_f/@acurretskillsize.to_f)*5
      k.insert(3, y)
    end

	  top_5_matches_full.shift
		top_5_matches_full.each do |jobscore|

        userid = nil
        jobid = jobscore[0]
        score = jobscore[3]
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