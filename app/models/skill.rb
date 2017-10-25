class Skill < ApplicationRecord
  self.table_name= "Skills"
  has_many :UserSkills
  has_many :JobSkills
end
