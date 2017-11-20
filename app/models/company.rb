class Company < ApplicationRecord
  self.table_name= "Companies"
  has_many :Bookmarks, :foreign_key => 'CompanyId'
  has_many :Jobs, :foreign_key => 'CompanyId'
  belongs_to :Cities, :foreign_key => 'CityId'
end
