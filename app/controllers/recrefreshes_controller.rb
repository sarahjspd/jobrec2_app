class RecrefreshesController < ApplicationController

	def create
		
		# A Variable ----------------------------------------------------------------
# ApplicationScore.destroy_all  	
# GenerateApplicationScoreService.new.call
			
		# B Variable ----------------------------------------------------------------
BookmarkScore.destroy_all
GenerateBookmarkScoreService.new.call
	   
 		# C Variable ----------------------------------------------------------------
# CategoryScore.destroy_all
# GenerateCategoryScoreService.new.call
 	
	    # S Variable ----------------------------------------------------------------
# SkillScore.destroy_all
# GenerateSkillScoreService.new.call
	redirect_to admins_path
	end


end