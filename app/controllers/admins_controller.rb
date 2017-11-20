class AdminsController < ApplicationController

	def index

		@recommended_jobs_till_date = Record.all.pluck(:jobrec_id).count
		@recommended_jobs_till_date_users = Record.all.pluck(:user_id).uniq.count
		@matches = Record.where("records.applicant_id IS NOT NULL")
		@matches_lessoneday = @matches.map { |f| f if (f.updated_at - f.created_at) < 86400 }.compact
		@matches_lessoneday_topjob = Job.where(id: @matches_lessoneday.pluck(:jobrec_id).group_by{|x| x}.sort_by{|k, v| -v.size}.map(&:first)).uniq.first(2)
		@matches_moreoneday = @matches.map { |f| f if (f.updated_at - f.created_at) < 604800 }.compact - @matches_lessoneday
		@matches_moreoneday_topjob = Job.where(id: @matches_moreoneday.pluck(:jobrec_id).group_by{|x| x}.sort_by{|k, v| -v.size}.map(&:first)).uniq.first(2)


	end

end

