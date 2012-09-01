require 'rubygems'
require 'openssl'
require 'cgi'
require 'base64'
require 'openssl'
require 'net/http'
require 'net/https'
require 'typhoeus'
require 'json'


TCA_ENV = 'production' unless defined?(TCA_ENV)
THE_CITY_ADMIN_PATH = 'https://api.onthecity.org' unless defined?(THE_CITY_ADMIN_PATH)
THE_CITY_ADMIN_API_VERSION = 'application/vnd.thecity.admin.v1+json' unless defined?(THE_CITY_ADMIN_API_VERSION)

# The path to the lib directory.
THECITY_LIB_DIR = File.dirname(__FILE__)

# The path to the storage directory that will be used for caching data to disk.
THECITY_STORAGE_DIR = File.dirname(__FILE__) + '/../storage/'

require File.dirname(__FILE__) + '/auto_load.rb'

require File.dirname(__FILE__) + '/common.rb'


# This class is meant to be a wrapper TheCity Admin API (OnTheCity.org).
module TheCity

  class AdminApi

    attr_reader :api_key, :api_token


    # Alias for calling the *new* method.
    def self.connect(api_key, api_token)
      self.new(api_key, api_token)
    end


    # Constructor.
    #
    # @param api_key The API key for the church.
    # @param api_token The API token for the church.
    def initialize(api_key, api_token)
      raise TheCityExceptions::UnableToConnectToTheCity.new('Key and Token cannot be nil.') if api_key.nil? or api_token.nil?

      # Create a constant for the churches API key.
      TheCity::AdminApi::const_set(:API_KEY, api_key) unless defined?(API_KEY)

      # Create a constant for the churches API Token.
      TheCity::AdminApi::const_set(:API_TOKEN, api_token) unless defined?(API_TOKEN)
    end

  end

end
