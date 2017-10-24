class Bookmark < ApplicationRecord
  self.table_name= "Bookmarks"
  has_many :bookmark_scores

end
