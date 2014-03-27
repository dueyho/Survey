require 'active_record'
require 'rspec'
require 'answer'
require 'question'
require 'survey'
require 'taker'
require 'shoulda-matchers'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    Answer.all.each { |x| x.destroy }
    Question.all.each { |x| x.destroy }
    Survey.all.each { |x| x.destroy }
    Taker.all.each { |x| x.destroy }
  end
end
