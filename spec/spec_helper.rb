require File.dirname(__FILE__) + "/../lib/parameterized_cache"

require 'action_mailer'
require 'action_controller/test_case'
require 'action_view/base'
require 'rspec/rails'
require 'rspec/rails/example/rails_example_group'
require 'rspec/rails/example/controller_example_group'
require 'rspec/rails/example/request_example_group'
require 'rspec/rails/example/helper_example_group'
require 'rspec/rails/example/view_example_group'
require 'rspec/rails/example/mailer_example_group'
require 'rspec/rails/example/routing_example_group'
require 'rspec/rails/example/model_example_group'

def controller
  ActionController::Base.new
end

ActionController::Base.perform_caching = true
ActionController::Base.cache_store = :memory_store

RSpec.configure do |config|
  require "rspec/expectations"
  config.include RSpec::Matchers
  config.include RSpec::Rails::HelperExampleGroup
  
  config.mock_with :rspec
end
