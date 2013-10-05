class Project < ActiveRecord::Base
	validates :title, presence: true
	validates :essay, presence: true, length: { 
				greater_than: 500
			}
	belongs_to :user
end
