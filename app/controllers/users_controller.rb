class UsersController < ApplicationController
	
	def index

		@firstuser = User.first	
		@firstascore = ApplicationScore.first

	end
end