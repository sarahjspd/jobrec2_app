class JobSkill < ActiveRecord::Base
	self.table_name = "JobSkills"
	has_many :skill_scores
	belongs_to :Jobs
	belongs_to :Skills
end
