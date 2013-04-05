class ProjectsController < ApplicationController
	before_filter :login_required
	before_filter :permission_check, :except => [:index, :new, :create, :show]

	def show
		@project = Project.find(params[:id])
		render :template => "/projects/index" and return
	end

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

		redirect_to projects_path
	end

	def edit
	end

	def update
		unless @project.update_attributes(params[:project])
			notify_error(@project)
		end
	end

	def destroy
		unless @project.destroy
			flash[:notice] = "destroy project failed."
		end
		
		redirect_to projects_path
	end

protected
	def permission_check
		@project = Project.find(params[:id])
		unless @project.user.id == @current_user.id
			raise PermissionException
		end
	end
end
