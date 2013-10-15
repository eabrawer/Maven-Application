class Project < ActiveRecord::Base
	attr_accessible :title, :essay, :avatar
	validates :title, presence: true
	validates :essay, presence: true, length: { 
				minimum: 1
			}
	belongs_to :user
	has_many :project_users # This refers to users that can edit a user's project
	has_many :authorized_users, :through => :project_users, :source => :user
	has_many :comments
	mount_uploader :avatar, ProjectAvatarUploader
	has_reputation :votes, :source => :user, :aggregated_by => :sum
end
