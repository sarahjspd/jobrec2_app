class Job < ApplicationRecord
  self.table_name= "Jobs"
  has_many :application_scores
  has_many :bookmark_scores
  has_many :job_category_scores

  has_many :jobs, :class_name => 'Job', :foreign_key => 'job_id'
  has_many :jobrec, :class_name => 'Job', :foreign_key => 'jobrec_id'

  has_many :JobSkills
  has_many :Bookmarks
  has_many :Applications

end
