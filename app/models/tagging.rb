class Tagging < ActiveRecord::Base
  belongs_to :tag
  attr_accessible :project, :to
end
