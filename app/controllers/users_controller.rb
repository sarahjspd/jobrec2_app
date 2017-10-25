class UsersController < ApplicationController

	def index

		@firstuser = User.first
		@firstascore = ApplicationScore.first
		@job= Job.first
		@application = Application.first
		@user = User.last
		@bookmark = Bookmark.last
		@jobcat = JobCategory.first
		@jobtitle = JobTitle.first
		@skill = Skill.first
	end
end
