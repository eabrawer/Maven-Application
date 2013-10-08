class Project < ActiveRecord::Base
	attr_accessible :title, :essay
	validates :title, presence: true
	validates :essay, presence: true, length: { 
				minimum: 100
			}
	belongs_to :user
	mount_uploader :avatar, ProjectAvatarUploader
end
