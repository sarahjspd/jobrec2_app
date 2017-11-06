class RecrefreshesController < ApplicationController

	def create
		
		# A Variable ----------------------------------------------------------------
   	
#GenerateApplicationScoreService.new.call
			
		# B Variable ----------------------------------------------------------------
	   
GenerateBookmarkScoreService.new.call
	   
 		# C Variable ----------------------------------------------------------------
#GenerateCategoryScoreService.new.call
 	
	    # S Variable ----------------------------------------------------------------
#GenerateSkillScoreService.new.call
	redirect_to admins_path
	end


end