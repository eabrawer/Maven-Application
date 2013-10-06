class Project < ActiveRecord::Base
	validates :title, presence: true
	validates :essay, presence: true, length: { 
				minimum: 100
			}
	belongs_to :user
end
