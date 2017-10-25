class Bookmark < ApplicationRecord
  self.table_name= "Bookmarks"
  has_many :bookmark_scores
  belongs_to :Jobs
  belongs_to :Users
end
