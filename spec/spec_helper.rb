# frozen_string_literal: true
require 'otr-activerecord'
$LOAD_PATH.unshift(
  File.expand_path("..", __dir__),
  File.expand_path("../config", __dir__),
  File.expand_path("../api", __dir__)
)
ENV["RACK_ENV"] ||= "test"
require "environment"
require "task"

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end
end