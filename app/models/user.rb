class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :email, :first_name, :last_name, 
  :password, :password_confirmation, :avatar
  # has_secure_password


  validates :email, uniqueness: true, presence: true, :format =>
  {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, confirmation: true
  validates :password, presence: true, length: {
    minimum: 7
  }


  has_many :projects
  has_many :project_users
  has_many :comments
  mount_uploader :avatar, UserAvatarUploader
  has_reputation :votes, :source => {:reputation => :votes, 
  :of => :projects && :comments}, :aggregated_by => :sum 

  after_save :populate_name

  def populate_name!
    # TODO: take first and last name and save it into new "name" column
    # Make sure attr accessibles are set too !
    combo_name = first_name + " " + last_name
    self.update_column(:name, combo_name)
  end

end
