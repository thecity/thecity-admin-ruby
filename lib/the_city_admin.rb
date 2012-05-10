require 'rubygems'
require 'openssl'
require 'CGI'
require 'Base64'
require 'openssl'
require 'net/http'
require 'net/https'



# The path to the lib directory.
THECITY_LIB_DIR = File.dirname(__FILE__)

require File.dirname(__FILE__) + '/common.rb'  

require File.dirname(__FILE__) + '/auto_load.rb'


# This class is meant to be a wrapper TheCity Admin API (OnTheCity.org).
class TheCityAdmin

  # Constructor.
  #
  # <b>api_key</b> The API key for the church.
  # <b>api_token</b> The API token for the church.
  def initialize(api_key, api_token)
    # The API key for the church.
    @api_key = api_key

    # The API token for the church.
    @api_token = api_token
  end

end

