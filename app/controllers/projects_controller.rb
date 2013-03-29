class ProjectsController < ApplicationController
	before_filter :login_required

	def new
		@project = Project.new
	end 

	def create
		@project = Project.new(params[:project].merge(:user_id => @current_user.id))

		if @project.save
			#flash[:notice] = "save project ok."
		else
			flash[:notice] = "save task failed."
		end

		redirect_to root_path
	end
end
