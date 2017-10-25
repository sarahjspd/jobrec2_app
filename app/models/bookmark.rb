class Bookmark < ApplicationRecord
  self.table_name= "Bookmarks"
  has_many :bookmark_scores
  belongs_to :Job, :foreign_key => 'JobId'
  belongs_to :Company, :foreign_key => 'CompanyId'
  belongs_to :User, :foreign_key => 'UserId'
end
