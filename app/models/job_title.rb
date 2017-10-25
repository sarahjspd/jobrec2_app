class JobTitle < ActiveRecord::Base
	self.table_name = "JobTitles"

	belongs_to :JobCategory
end
