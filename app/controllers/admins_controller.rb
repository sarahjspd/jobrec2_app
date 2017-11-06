class AdminsController < ApplicationController

	def index
		@recommended_jobs_till_date = Record.all.pluck(:jobrec_id).count
		@recommended_jobs_till_date_users = Record.all.pluck(:user_id).uniq.count
		@matches = Record.where("records.applicant_id IS NOT NULL")
		
	end





end