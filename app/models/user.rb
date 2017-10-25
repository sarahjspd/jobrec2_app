class User < ActiveRecord::Base
	self.table_name = "Users"
	has_many :UserSkills
	has_many :Bookmarks

end
