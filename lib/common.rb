require 'rubygems'
require 'openssl'
require 'CGI'
require 'Base64'
require 'openssl'
require 'net/http'
require 'net/https'
require 'typhoeus'

TCA_ENV = 'development'

# The path to the lib directory.
THECITY_LIB_DIR = File.dirname(__FILE__)

# The path to the storage directory that will be used for caching data to disk.
THECITY_STORAGE_DIR = File.dirname(__FILE__) + '/../storage/'


require File.dirname(__FILE__) + '/auto_load.rb'

require File.dirname(__FILE__) + '/common.rb'


module TheCity

  class AdminApi

    # TODO: This needs to be moved into a config file.
    ######################################################
    if TCA_ENV == 'production'
      raise 'Admin API path not set for production' # Delete this exception when set
      THE_CITY_ADMIN_PATH = ''
      THE_CITY_ADMIN_API_VERSION = 'application/vnd.thecity.v1+json'
    
    elsif TCA_ENV == 'development'
      THE_CITY_ADMIN_PATH = 'http://api.devthecity.org:3000'
      THE_CITY_ADMIN_API_VERSION = 'application/vnd.thecity.v1+json'
    
    elsif TCA_ENV == 'staging'
      raise 'Admin API path not set for testing' # Delete this exception when set
      THE_CITY_ADMIN_PATH = ''
      THE_CITY_ADMIN_API_VERSION = 'application/vnd.thecity.v1+json'

    elsif TCA_ENV == 'test'
      raise 'Admin API path not set for testing' # Delete this exception when set
      THE_CITY_ADMIN_PATH = ''
      THE_CITY_ADMIN_API_VERSION = 'application/vnd.thecity.v1+json'
    end
    ######################################################


    def self.admin_load_path(method, api_key, api_token, params = {})
      path = "#{THE_CITY_ADMIN_PATH}/accounts/#{city_account_id}/users/#{city_user_id}/#{extended_path}.json"
      self.typhoeus_request(method, path, params)
    end


    def self.typhoeus_request(method, path, params = {})
      headers = self._build_admin_headers(method, path) 
      case method 
      when :post
        Typhoeus::Request.post(path, {:headers => headers, :params => self._flatten_params(params)}).body
      when :get
        Typhoeus::Request.get(path, {:headers => headers, :params => self._flatten_params(params)}).body
      when :put
        Typhoeus::Request.put(path, {:headers => headers, :params => self._flatten_params(params)}).body
      when :delete
        Typhoeus::Request.delete(path, {:headers => headers, :params => self._flatten_params(params)}).body
      end
    end


    def self._flatten_params(params)
      retval = {}
      params.each do |key, value|
        if value.instance_of?(Array)
          value.each_with_index { |a_val, indx| retval["#{key}[#{indx}]"] = a_val }      
        else # assume string
          retval[key] = value
        end
      end
      retval
    end


    def self._build_admin_headers(method, path) 
      method_request = method.to_s.upcase
      url = THE_CITY_ADMIN_PATH + path
      current_time = Time.now.to_i.to_s
      string_to_sign = current_time.to_s + method_request + url
      unencoded_hmac = OpenSSL::HMAC.digest('sha256', TheCity::AdminApi::API_KEY, string_to_sign)
      unescaped_hmac = Base64.encode64(unencoded_hmac).chomp
      hmac_signature = CGI.escape(unescaped_hmac)

      {'X-City-Sig' => hmac_signature,
       'X-City-User-Token' => TheCity::AdminApi::API_TOKEN,
       'X-City-Time' => current_time,
       'Accept' => 'application/vnd.thecity.v1+json'}
    end  

  end

end


