class Project < ActiveRecord::Base
	attr_accessible :title, :essay, :avatar, :tag_list
	
	validates :title, presence: true
	validates :essay, presence: true, length: { 
				minimum: 1
			}

	mount_uploader :avatar, ProjectAvatarUploader
	has_reputation :votes, :source => :user, :aggregated_by => :sum

	belongs_to :user
	has_many :comments
	has_many :taggings
	has_many :tags, through: :taggings
end