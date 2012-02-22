# Project::    TheCity Admin API 
# File::       the_city.rb
#
# Author:: Wes Hays <weshays@gbdev.com> 
# Link:: https://github.com/weshays/admin-api-ruby
# Version:: 0.1a
# Package:: TheCity::Admin

require 'rubygems'
require 'openssl'
require 'CGI'


# The path to the lib directory.
THECITY_LIB_DIR = File.dirname(__FILE__)
  

require File.dirname(__FILE__) + '/auto_load.rb'


# This class is meant to be a wrapper TheCity Admin API (OnTheCity.org).
class TheCity

  # Constructor.
  def initialize(api_key)
  end
  
end

