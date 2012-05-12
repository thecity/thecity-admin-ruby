require 'rubygems'
require 'openssl'
require 'CGI'
require 'Base64'
require 'openssl'
require 'net/http'
require 'net/https'
require 'typhoeus'
require 'json'



TCA_ENV = 'development'

# The path to the lib directory.
THECITY_LIB_DIR = File.dirname(__FILE__)

# The path to the storage directory that will be used for caching data to disk.
THECITY_STORAGE_DIR = File.dirname(__FILE__) + '/../storage/'



# TODO: This needs to be moved into a config file.
######################################################
if TCA_ENV == 'production'
  raise 'Admin API path not set for production' # Delete this exception when set
  THE_CITY_ADMIN_PATH = ''
  THE_CITY_ADMIN_API_VERSION = 'application/vnd.thecity.admin.v1+json'

elsif TCA_ENV == 'development'
  THE_CITY_ADMIN_PATH = 'http://api.devthecity.org:9292'
  THE_CITY_ADMIN_API_VERSION = 'application/vnd.thecity.admin.v1+json'

elsif TCA_ENV == 'staging'
  raise 'Admin API path not set for testing' # Delete this exception when set
  THE_CITY_ADMIN_PATH = ''
  THE_CITY_ADMIN_API_VERSION = 'application/vnd.thecity.admin.v1+json'

elsif TCA_ENV == 'test'
  raise 'Admin API path not set for testing' # Delete this exception when set
  THE_CITY_ADMIN_PATH = ''
  THE_CITY_ADMIN_API_VERSION = 'application/vnd.thecity.admin.v1+json'
end
######################################################



require File.dirname(__FILE__) + '/auto_load.rb'

require File.dirname(__FILE__) + '/common.rb'


# This class is meant to be a wrapper TheCity Admin API (OnTheCity.org).
module TheCity

  class AdminApi

    attr_reader :api_key, :api_token

    # Constructor.
    #
    # <b>api_key</b> The API key for the church.
    # <b>api_token</b> The API token for the church.
    def initialize(api_key, api_token)
      # Create a constant for the churches API key.
      TheCity::AdminApi::const_set(:API_KEY, api_key)

      # Create a constant for the churches API Token.
      TheCity::AdminApi::const_set(:API_TOKEN, api_token)

      # User list usage variables
      @users_page_requested = 0
      @users_per_page_requested = 0    
      @user_list = nil
    end


    # Shows all the topics posted on the Plaza.
    # <b>page</b> The page number to get.  Default 1.
    # <b>per_page</b> The number of items to show.  Default 20.
    # <b>options</b>
    #
    # Returns array of users for the specified.
    def users(page = 1, per_page = 20, options = {})
      return @user_list if @users_page_requested == page and @users_per_page_requested == per_page and !@user_list.nil?  
      @users_page_requested = page
      @users_per_page_requested = per_page
      loader = UserListLoader.new(page, per_page)    
      @user_list = UserList.new( loader );
      return @user_list
    end  

  end

end
