class SkillScoresController < ApplicationController
#has if/else
	def index
	#  if @userpresent = current_member.present?

		# 	@user = User.find_by(email: current_member.email)
		@user = User.all.where(role: "CANDIDATE").first(2) #remove first(2)
		@user.each do |eachuser|

	    @skill = eachuser.Skills.pluck(:id)
	    all_job = Job.first(50) #change to Job.all.where(status: "OPEN")
	    #all_job = Job.first(100).where(status: "OPEN")
	    array_of_skills = []
	    array_of_jobid=[]
	    all_job.each do |getarray|
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

	    top_5_matches_full = b.each.max_by(6){|i| i[2]}

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

	        userid = eachuser.id
	        jobid = jobscore[0]
	        score = jobscore[3]
	        originaljob = nil



	        SkillScore.create(user_id: userid, originaljob_id: originaljob, job_id: jobid, sscore: score)
	    end
		end

########
  else
########
    job = Job.all.where(status: "OPEN").first(1) #remove first(1)
		job.each do |x|

	    @skill = x.Skills.pluck(:id)
	    a = Job.all.where(status: "OPEN").first(50).pluck(:id) # remove first(50)
	    #all_job = Job.first(100).where(status: "OPEN")
	    array_of_skills = []
	    array_of_jobid=[]

			Job.where(id: a).each do |getarray|
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

	    @acurretskillsize= @skill.size


	    top_5_matches_full.each do |k|
	      match =k[2]
	      y= (match.to_f/@acurretskillsize.to_f)*5
	      k.insert(3, y)
	    end

		  top_5_matches_full.shift
			top_5_matches_full.each do |jobscore|

	        userid = nil
	        jobid = jobscore[0]
	        score = jobscore[3]
	        originaljob = x.id

	        SkillScore.create(user_id: userid, originaljob_id: originaljob, job_id: jobid, sscore: score)
	    end
		end
  end


end
# #has if/else
# 	def index
# 	 @user = User.find_by(email: current_member.email)
#     if @user.present?
#     @skill = @user.Skills.pluck(:id)
#     all_job = Job.first(50)
#     #all_job = Job.first(100).where(status: "OPEN")
#     array_of_skills = []
#     array_of_jobid=[]
#     all_job.each do |getarray|
#       allarray= getarray.Skills.pluck(:id)
#       array_of_skills << allarray
#
#     end
#     a = all_job.pluck(:id)
#     array_of_skills.each.with_index(1) { |e,i| a.insert((2*i)-1,e) }
#     a.each_slice(2).to_a
#     b=a.each_slice(2).to_a
#
#     b.each do |t|
#       matched_skills = @skill & t[1]
#       matched_count = matched_skills.count
#       t.insert(2, matched_count)
#     end
#
#     top_5_matches_full = b.each.max_by(6){|i| i[2]}
#
#     top_5_matches_full.each do |k|
#       top_5_matches_jobid_only = [k[0]]
#
#     end
#
#     @acurretskillsize= @skill.size
#
#
#     top_5_matches_full.each do |k|
#       x =k[2]
#       y= (x.to_f/@acurretskillsize.to_f)*5
#       k.insert(3, y)
#     end
#     top_5_matches_full.shift
#     top_5_matches_full.each do |jobscore|
#
#         userid = User.first[:id]
#         jobid = jobscore[0]
#         score = jobscore[3]
#         originaljob = nil
#
#
#
#         SkillScore.create(user_id: userid, originaljob_id: originaljob, job_id: jobid, sscore: score)
#     end
#
# ########
#   else
# ########
#     @job = Job.second
#     @skill = @job.Skills.pluck(:id)
#     all_job = Job.first(50)
#     #all_job = Job.first(100).where(status: "OPEN")
#     array_of_skills = []
#     array_of_jobid=[]
#     all_job.each do |getarray|
#       allarray= getarray.Skills.pluck(:id)
#       array_of_skills << allarray
#
#     end
#     a = all_job.pluck(:id)
#     array_of_skills.each.with_index(1) { |e,i| a.insert((2*i)-1,e) }
#     a.each_slice(2).to_a
#     b=a.each_slice(2).to_a
#
#     b.each do |t|
#       matched_skills = @skill & t[1]
#       matched_count = matched_skills.count
#       t.insert(2, matched_count)
#     end
#
#     top_5_matches_full = b.each.max_by(6){|i| i[2]}
#
#     top_5_matches_full.each do |k|
#       top_5_matches_jobid_only = [k[0]]
#
#     end
#
#     @acurretskillsize= @skill.size
#
#
#     top_5_matches_full.each do |k|
#       x =k[2]
#       y= (x.to_f/@acurretskillsize.to_f)*5
#       k.insert(3, y)
#     end
#     top_5_matches_full.shift
#     top_5_matches_full.each do |jobscore|
#
#         userid = nil
#         jobid = jobscore[0]
#         score = jobscore[3]
#         originaljob = Job.first[:id]
#         SkillScore.create(user_id: userid, originaljob_id: originaljob, job_id: jobid, sscore: score)
#     end
#   end
#   end
#
# end
