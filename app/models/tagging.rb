class Tagging < ActiveRecord::Base
  attr_accessible :project, :to

  belongs_to :tag
end
