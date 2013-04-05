class TasksController < ApplicationController
	before_filter :login_required
	before_filter :permission_check, :except => [:index, :new, :create, :take, :drop, :done]

	def new
		@task = Task.new
	end

	def create
		@task = Task.new(params[:task].merge(:user_id => @current_user.id))
		
		if @task.save
		else
			flash[:notice] = "save task failed."
		end

		redirect_to :back
	end

	def update
		unless @task.update_attributes(params[:task])
			notify_error(@task)
		end
	end

	def take
		@task = Task.find(params[:id])

		if @task.update_attribute(:worker_id, @current_user.id)
		else
			flash[:notice] = "save task failed."
		end	

		redirect_to :back
	end

	def drop
		@task = Task.find(params[:id])

		if @task.done?
			@task.update_attribute(:done, 0)
		else 
			@task.update_attribute(:worker_id, 0)
		end

		redirect_to :back
	end
	
	def done
		@task = Task.find(params[:id])
		@task.update_attribute(:done, 1)
	
		redirect_to :back
	end

	def destroy
		unless @task.destroy
			flash[:notice] = "destroy task failed."
		end
		
		redirect_to :back
	end

protected
	def permission_check
		@task = Task.find(params[:id])
		unless @task.user.id == @current_user.id
			raise PermissionException
		end
	end
end
