class Comment < ActiveRecord::Base
  attr_accessible :text
  belongs_to :user
  belongs_to :project

  has_reputation :votes, :source => :user, :aggregated_by => :sum
end
