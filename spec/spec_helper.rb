require_relative '../lib/teamwork'
require_relative 'support/helpers.rb'
require 'rspec'
require 'dotenv'

Dotenv.load

RSpec.configure do |config|

  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.include Helpers

end