class Project < ActiveRecord::Base
	attr_accessible :title, :essay, :avatar, :tag_list, :authorized_users_attributes
	
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
	has_many :project_users # This refers to users that can edit a user's project
	has_many :authorized_users, :through => :project_users, :source => :user
	accepts_nested_attributes_for :authorized_users

	def self.tagged_with(name)
  	Tag.find_by_name!(name).projects
	end

	def self.tag_counts
	  Tag.select("tags.*, count(taggings.tag_id) as count").
	    joins(:taggings).group("taggings.tag_id")
	end

	def tag_list
	  tags.map(&:name).join(", ")
	end

	def tag_list=(names)
	  self.tags = names.split(",").map do |n|
	    Tag.where(name: n.strip).first_or_create!
	  end
	end

	def self.search(search)
	  if search
	  	#Tag.find_by_name!(search).projects
	  	tag = Tag.where("lower(name) = ?", search.downcase).first
	  	if tag 
	  		tag.projects
	  	end
	    # find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	  else
	    redirect_to root_path# find(:all)
	  end
	end
end
