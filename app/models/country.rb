class Country < ApplicationRecord
	self.table_name= "Countries"

	self.primary_key = "code"
	has_many :Users, :foreign_key => 'CountryCode'
	has_many :Cities, :foreign_key => 'CountryCode'
end