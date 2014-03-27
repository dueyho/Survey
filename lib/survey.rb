class Survey < ActiveRecord::Base
  validates :name, :presence => true, :length => { :maximum => 50 }
  has_many(:questions)
  has_many :answers, :through => :questions
  has_and_belongs_to_many(:takers)


end
