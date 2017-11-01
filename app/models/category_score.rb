class CategoryScore < ApplicationRecord

	belongs_to :originaljob, :class_name => 'Job'
	belongs_to :job


end
