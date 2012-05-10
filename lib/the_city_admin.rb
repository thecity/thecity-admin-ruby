require 'rubygems'
require 'openssl'
require 'CGI'


# The path to the lib directory.
THECITY_LIB_DIR = File.dirname(__FILE__)
  

require File.dirname(__FILE__) + '/auto_load.rb'

require File.dirname(__FILE__) + '/common.rb'


# This class is meant to be a wrapper TheCity Admin API (OnTheCity.org).
class TheCityAdmin

  

  # Constructor.
  def initialize(api_key)
  end
  
end

