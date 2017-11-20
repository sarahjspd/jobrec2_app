class Job < ApplicationRecord
  self.table_name= "Jobs"
  has_many :application_scores
  has_many :bookmark_scores
  has_many :job_category_scores

  has_many :jobs, :class_name => 'Job', :foreign_key => 'job_id'
  has_many :jobrec, :class_name => 'Job', :foreign_key => 'jobrec_id'
  has_many :originaljobs, :class_name => 'application_score', :foreign_key => 'originaljob_id'
  has_many :originaljobs, :class_name => 'bookmark_score', :foreign_key => 'originaljob_id'
  has_many :originaljobs, :class_name => 'category_score', :foreign_key => 'originaljob_id'
  # has_many :originaljobs, :class_name => 'skill_score', :foreign_key => 'originaljob_id'


  has_many :JobSkills, :foreign_key => 'JobId'
  has_many :Skills, through: :JobSkills, source: :Skill


  has_many :Bookmarks, :foreign_key => 'JobId'
  has_many :busers, through: :Bookmarks, source: :User


  has_many :Applications, :foreign_key => 'JobId'
  has_many :ausers, through: :Applications, source: :User

  belongs_to :Company, :foreign_key => 'CompanyId'
  belongs_to :JobCategory, :foreign_key => 'JobCategoryId'
  belongs_to :City, :foreign_key => 'CityId'
end
