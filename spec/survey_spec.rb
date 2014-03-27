require 'spec_helper'

describe Survey do
  it { should have_many :questions}
  it { should have_and_belong_to_many :takers}
  it { should validate_presence_of :name}
  it { should ensure_length_of(:name).is_at_most(50) }
end
