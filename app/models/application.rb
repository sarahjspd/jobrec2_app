class Application < ApplicationRecord
  self.table_name= "Applications"
  belongs_to :User, :foreign_key => 'ApplicantId'
  belongs_to :Job, :foreign_key => 'JobId'

end
