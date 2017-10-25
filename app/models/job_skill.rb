class JobSkill < ActiveRecord::Base
	self.table_name = "JobSkills"
	has_many :skill_scores
	belongs_to :Job, :foreign_key => 'JobId'
	belongs_to :Skill, :foreign_key => 'SkillId'
end
