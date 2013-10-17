class Comment < ActiveRecord::Base
  attr_accessible :text
  validates :text, length: { 
				minimum: 2
	}
  belongs_to :user
  belongs_to :project

  has_reputation :votes, :source => :user, :aggregated_by => :sum
end
