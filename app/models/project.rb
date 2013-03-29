class Project < ActiveRecord::Base
	attr_accessible :user_id, :title

	belongs_to :user
end
