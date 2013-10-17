class Tag < ActiveRecord::Base
  attr_accessible :name
  validates :name, length: { 
	minimum: 3
	} 
  has_many :taggings
  has_many :projects, through: :taggings
end
