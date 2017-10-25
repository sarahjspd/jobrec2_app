class UserSkill < ActiveRecord::Base
	self.table_name = "UserSkills"

	has_many :skill_scores
	belongs_to :Skill
	belongs_to :User
end
