require 'spec_helper'

describe Question do
  it { should have_many :answers}
  it { should validate_presence_of :description}
  it { should ensure_length_of(:description).is_at_most(150)}
  it { should ensure_length_of(:description).is_at_least(3)}
end
