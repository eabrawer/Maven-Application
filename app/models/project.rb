class Project < ActiveRecord::Base
	attr_accessible :title, :essay, :avatar
	validates :title, presence: true
	validates :essay, presence: true, length: { 
				minimum: 100
			}
	belongs_to :user
	has_many :comments
	mount_uploader :avatar, ProjectAvatarUploader
end
