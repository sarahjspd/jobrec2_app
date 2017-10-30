class User < ActiveRecord::Base
	self.table_name = "Users"
	has_many :UserSkills, :foreign_key => 'UserId'
	has_many :Bookmarks, :foreign_key => 'UserId'
	has_many :bjobs, through: :Bookmarks, source: :Job


	has_many :Applications, :foreign_key => 'ApplicantId'
	has_many :ajobs, through: :Applications, source: :Job

	has_many :Countries, :foreign_key => 'CountryCode'

	belongs_to :City, :foreign_key => 'CityId'


end
