class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :email, :first_name, :last_name, 
  :password, :password_confirmation, :avatar
  # has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, confirmation: true
  
  has_many :projects
  has_many :project_users
  has_many :comments
  mount_uploader :avatar, UserAvatarUploader
  has_reputation :votes, :source => {:reputation => :votes, 
  :of => :projects && :comments}, :aggregated_by => :sum 
end
