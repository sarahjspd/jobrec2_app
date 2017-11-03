class JobsController < ApplicationController

 	def index
 		#@joblist = Job.limit(100)
    @joblist = Job.all.where(createdAt: 30.days.ago..Time.now, status: "OPEN").order(createdAt: :desc)
 	end

 	def show


   	@job = Job.find(params[:id])
      @skill = @job.Skills.pluck(:name)


	end




end
