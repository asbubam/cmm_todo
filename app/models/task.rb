# encoding : UTF-8
class Task < ActiveRecord::Base
	attr_accessible :user_id, :worker_id, :project_id, :content, :done

	belongs_to :user
	belongs_to :worker, :foreign_key => :worker_id, :class_name => 'User'
	belongs_to :project

	validates :content, :presence => { :messsage => "내용을 입력해 주십시오" }

	scope :todo, :conditions => "worker_id=0 and done=0", :order => "id desc"
	scope :doing, :conditions => "worker_id!=0 and done=0"
	scope :done, :conditions => "done=1"

	def todo?
		self.worker_id == 0 && self.done == 0
	end
	
	def doing?
		self.worker_id != 0 && self.done == 0
	end

	def done?
		self.done != 0
	end
end
