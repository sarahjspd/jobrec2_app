class Bookmark < ApplicationRecord
  self.table_name= "Bookmarks"
  has_many :bookmark_scores
  belongs_to :Job
  belongs_to :User, foreign_key: :UserID
end
