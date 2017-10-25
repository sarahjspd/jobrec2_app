class Application < ApplicationRecord
  self.table_name= "Applications"
  has_many :application_scores
  belongs_to :Jobs
end
