class MainController < ApplicationController
	def index
		unless @current_user.blank?
			redirect_to projects_path
		end
	end
end
