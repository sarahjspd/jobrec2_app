class SkillScore < ApplicationRecord

	#belongs_to :user_skill
	# belongs_to :job_skill
	# belongs_to :originaljob, :class_name => 'Job'
	belongs_to :job
	# belongs_to :user


end
