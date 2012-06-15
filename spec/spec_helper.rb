# Project::    TheCity Admin API 
# File::       the_city.rb
#
# Author:: Wes Hays <weshays@gbdev.com> 
# Link:: https://github.com/weshays/admin-api-ruby
# Version:: 0.1a
# Package:: TheCity::Admin

require 'rubygems'
require 'rspec'
require 'ruby-debug'

require File.expand_path( File.dirname(__FILE__) + '/../lib/the_city_admin.rb')


RSpec.configure do |config|
  config.mock_with :rspec
end