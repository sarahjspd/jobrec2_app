class City < ApplicationRecord
  self.table_name= "Cities"
  belongs_to :Country, :foreign_key => 'CountryCode'
  has_many :Companies, :foreign_key => 'CityId'
  has_many :Jobs, :foreign_key => 'CityId'
  has_many :Users, :foreign_key => 'CityId'
end
