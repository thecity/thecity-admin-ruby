require 'rubygems'
require 'openssl'
require 'cgi'
require 'Base64'
require 'openssl'
require 'net/http'
require 'net/https'
require 'typhoeus'
require 'json'


#TCA_ENV = 'development'
TCA_ENV = 'staging'

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
  THE_CITY_ADMIN_PATH = 'http://0.0.0.0:9292'
  THE_CITY_ADMIN_API_VERSION = 'application/vnd.thecity.admin.v1+json'

elsif TCA_ENV == 'staging'
  THE_CITY_ADMIN_PATH = 'https://api.stagethecity.org'
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
    # @param api_key The API key for the church.
    # @param api_token The API token for the church.
    def initialize(api_key, api_token)
      # Create a constant for the churches API key.
      TheCity::AdminApi::const_set(:API_KEY, api_key) unless defined?(API_KEY)

      # Create a constant for the churches API Token.
      TheCity::AdminApi::const_set(:API_TOKEN, api_token) unless defined?(API_TOKEN)

      # User list usage variables
      @users_page_requested = 0   
      @user_list = nil

      # Group list usage variables
      @groups_page_requested = 0
      @group_list = nil

      # Group list usage variables
      @metrics_page_requested = 0
      @metric_list = nil  
    end


    # Get a list of users.
    #
    # @param page The page number to get.  Default is 1.
    # @param options The options to specify for the user list.
    #
    # @return [UserList] based on the specified params.
    def users(options = {})
      page = options[:page] || 1
      return @user_list if @users_page_requested == page and !@user_list.nil?  
      @users_page_requested = page
      reader = UserListReader.new(page, options)    
      @user_list = UserList.new(reader)
      return @user_list
    end  


    # Get a list of groups.
    #
    # @param page The page number to get.  Default is 1.
    # @param options The options to specify for the group list.
    #
    # @return [GroupList] based on the specified params.
    def groups(page = 1, options = {})
      return @group_list if @groups_page_requested == page and !@group_list.nil?  
      @groups_page_requested = page
      reader = GroupListReader.new(page, options)    
      @group_list = GroupList.new(reader)
      return @group_list
    end

    def metrics(options = {})
      page = options[:page] || 1
      return @metric_list if @metrics_page_requested == page and !@metric_list.nil?  
      @metrics_page_requested = page
      reader = MetricListReader.new(page, options)    
      @metric_list = MetricList.new(reader)
      return @metric_list
    end

    def metric(metric_id)
      return Metric.load_metric_by_id(metric_id)
    end

  end

end
