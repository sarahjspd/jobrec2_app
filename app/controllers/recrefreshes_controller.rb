class RecrefreshesController < ApplicationController

	def create	
	# Application Score Variable ----------------------------------------------------------------
	ApplicationScore.destroy_all  	
	GenerateApplicationScoreService.new.call
				
	# Bookmark Score Variable ----------------------------------------------------------------
	BookmarkScore.destroy_all
	GenerateBookmarkScoreService.new.call
		   
	# Job Category Variable ----------------------------------------------------------------
	CategoryScore.destroy_all
	GenerateCategoryScoreService.new.call
	 	
	# Skill Score Variable ----------------------------------------------------------------
	SkillScore.destroy_all
	GenerateSkillScoreService.new.call
	redirect_to admins_path
	end


end