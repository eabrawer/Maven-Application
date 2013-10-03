class Project < ActiveRecord::Base
	validates :presence 
	validates :essay, presence: true, length: { 
				greater_than: 500
			}
end
