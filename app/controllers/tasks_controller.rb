class TasksController < ApplicationController
	before_filter :login_required

	def new
		@task = Task.new
	end

	def create
		@task = Task.new(params[:task].merge(:user_id => @current_user.id))
		
		if @task.save
		else
			flash[:notice] = "save task failed."
		end

		redirect_to root_path
	end
	
end
