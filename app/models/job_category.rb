class JobCategory < ActiveRecord::Base
	self.table_name = "JobCategories"
	has_many :category_scores
	has_many :JobTitles, :foreign_key => 'JobCategoryId'
	has_many :Jobs, :foreign_key => 'JobCategoryId'
end
