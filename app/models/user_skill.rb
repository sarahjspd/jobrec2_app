class UserSkill < ActiveRecord::Base
	self.table_name = "UserSkills"

	has_many :skill_scores


end
