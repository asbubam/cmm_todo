module ApplicationHelper

	def ymd(dto)
		return if dto.blank?
		dto.localtime.strftime("%Y-%m-%d %H:%M:%S")
	end
	
	def flash_messages
		fl = flash[:notice]
		flash[:notice] = nil
		fl
	end

	def logged_in?
		!@current_user.blank?
	end
end
