class Skill < ApplicationRecord
  self.table_name= "Skills"
  has_many :UserSkills, :foreign_key => 'SkillId'
  has_many :JobSkills, :foreign_key => 'SkillId'
end
