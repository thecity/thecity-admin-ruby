# Project::    TheCity Admin API 
# File::       the_city.rb
#
# Author:: Wes Hays <weshays@gbdev.com> 
# Link:: https://github.com/weshays/admin-api-ruby
# Version:: 0.1a
# Package:: TheCity::Admin


require File.expand_path( File.dirname(__FILE__) + '/../lib/the_city_admin.rb')

require 'rubygems'
require 'rspec'
require 'ruby-debug'

require 'factory_girl'
Dir.glob(File.dirname(__FILE__) + "/factories/*").each { |f| require f }


RSpec.configure do |config|
  config.mock_with :rspec
  config.include FactoryGirl::Syntax::Methods
end


def simulate_connection_to_server
  @the_city = TheCity::AdminApi.new('123', '456')
end