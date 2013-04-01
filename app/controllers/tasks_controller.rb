class TasksController < ApplicationController
	before_filter :login_required
	before_filter :permission_check, :except => [:index, :new, :create]

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
	
	def destroy
		unless @task.destroy
			flash[:notice] = "destroy task failed."
		end
		
		redirect_to root_path
	end

protected
	def permission_check
		@task = Task.find(params[:id])
		unless @task.user.id == @current_user.id
			render :text => "forbidden"
		end
	end
end
