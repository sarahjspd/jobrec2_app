class JobSkill < ActiveRecord::Base
	self.table_name = "JobSkills"
	has_many :skill_scores

end