class SkillScore < ApplicationRecord

	belongs_to :user_skill
	belongs_to :job_skill
	belongs_to :job


end
