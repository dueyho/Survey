require 'spec_helper'

describe Taker do
  it { should have_and_belong_to_many :surveys}
end
