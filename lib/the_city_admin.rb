require 'rubygems'
require 'openssl'
require 'CGI'
require 'Base64'
require 'openssl'
require 'net/http'
require 'net/https'



# The path to the lib directory.
THECITY_LIB_DIR = File.dirname(__FILE__)

# The path to the storage directory that will be used for caching data to disk.
THECITY_STORAGE_DIR = File.dirname(__FILE__) + '/../storage/'


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


    # The last number of users requested.
    @users_page_requested = 0
    @users_per_page_requested = 0    
  end


  # Shows all the topics posted on the Plaza.
  # <b>page</b> The page number to get.  Default 1.
  # <b>per_page</b> The number of items to show.  Default 20.
  # <b>options</b>
  #
  # Returns array of users for the specified.
  def users(page = 1, per_page = 20, options = {})
    return @users if @users_page_requested == page and @users_per_page_requested == per_page and !@users.nil?  
    @users_page_requested = page
    @users_per_page_requested = per_page
    loader = UserListLoader.new( @subdomain, num_per_page, @cacher )    
    @topics = Topics.new( loader );
    return @topics
  end  

end

