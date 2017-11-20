class UserSkill < ActiveRecord::Base
	self.table_name = "UserSkills"
	has_many :skill_scores
	belongs_to :Skill, :foreign_key => 'SkillId'
	belongs_to :User, :foreign_key => 'UserId'
end
