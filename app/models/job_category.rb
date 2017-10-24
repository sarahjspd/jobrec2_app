class JobCategory < ActiveRecord::Base
	self.table_name = "JobCategories"
	has_many :category_scores

end