class User < ActiveRecord::Base
	attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, 
	:avatar
	has_secure_password
	validates :email, uniqueness: true, presence: true
	validates :first_name, presence: true
	validates :last_name, presence: true
	has_many :projects
	has_many :comments
	mount_uploader :avatar, UserAvatarUploader
end
