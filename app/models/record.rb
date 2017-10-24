class Record < ApplicationRecord

	belongs_to :user
	belongs_to :job
	belongs_to :job, :class_name => 'Job'

end