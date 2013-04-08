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

	def auto_link(text)
		return "" if text.blank? 
		
		text.gsub(/^(.*?)(http[s]?:\/\/|www\.)([a-z0-9\-_?=\/:.]+)(.*)$/i) do |m|
    	"#{$1}<a href='#{ $2.start_with?('http') ? $2 : "http://#{$2}" }#{$3}'>link</a>#{$4}"
		end
	end
end
