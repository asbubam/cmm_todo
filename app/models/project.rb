class Project < ActiveRecord::Base
	attr_accessible :user_id, :title

	validates_presence_of :title

	belongs_to :user
end
