# encoding: UTF-8
class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def new 
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(params[:user])
		
		if @user.save
			@current_user = @user
			session[:user_id] = @user.id
		else
			flash[:notice] = "create user failed."
		end

		redirect_to root_path
	end
	
	def update
		@user = User.find(params[:id])

		if params[:user][:password].blank?
			params[:user].delete(:password)
			params[:user].delete(:password_confirmation)
		end

		if @user.update_attributes(params[:user])
			redirect_to root_path, notice:'User was successfully updated.' 
		else
			render :action => "edit"
		end
	end 

	def signin
		if u = User.authenticate(params[:user][:login], params[:user][:password]) 
			@current_user = u
			session[:user_id] = u.id

			redirect_to projects_path
		else
			@current_user = nil
			session[:user_id] = nil
			reset_session
		
			flash[:notice] = "Please check your ID and Password."
			redirect_to root_path
		end
	end

	def logout
		@current_user = nil
		session[:user_id] = nil
		reset_session

		redirect_to root_path
	end

end
