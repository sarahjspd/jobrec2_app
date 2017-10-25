class Application < ApplicationRecord
  self.table_name= "Applications"
  has_many :application_scores
  belongs_to :User, :foreign_key => 'ApplicantId'
  belongs_to :Job, :foreign_key => 'JobId'

end
