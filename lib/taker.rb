class Taker < ActiveRecord::Base
  has_and_belongs_to_many(:surveys)
end
