class Project < ActiveRecord::Base
	attr_accessible :user_id, :title

	validates_presence_of :title

	belongs_to :user
	
	has_many :tasks

	def owned_by?(u)
		u && u.id == self.user.id
	end
end
