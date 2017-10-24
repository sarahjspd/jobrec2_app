class UsersController < ApplicationController
	
	def index

		@firstuser = User.first
	
	end
end