class Question < ActiveRecord::Base
  validates :description, :presence => true, :length => {:minimum => 3, :maximum => 150}
  has_many(:answers)
end
