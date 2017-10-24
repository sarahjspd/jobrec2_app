class ApplicationScoresController < ApplicationController
	
	def index

		@firstascore = ApplicationScore.first
	
	end
end