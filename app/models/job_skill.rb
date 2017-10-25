class JobSkill < ActiveRecord::Base
	self.table_name = "JobSkills"
	has_many :skill_scores
	belongs_to :Job
	belongs_to :Skill
end
