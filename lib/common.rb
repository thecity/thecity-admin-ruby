module TheCityAdmin

  if Rails.env == 'production'
    raise 'Admin API path not set for production' # Delete this exception when set
    THE_CITY_ADMIN_PATH = ''
  
  elsif Rails.env == 'development'
    THE_CITY_ADMIN_PATH = 'http://system.devthecity.org:3000'
  
  elsif Rails.env == 'staging'
    raise 'Admin API path not set for testing' # Delete this exception when set
    THE_CITY_ADMIN_PATH = ''

  elsif Rails.env == 'test'
    raise 'Admin API path not set for testing' # Delete this exception when set
    THE_CITY_ADMIN_PATH = ''
  end


  def self.admin_headers
    {'X_EPISTLE_SERVER_KEY' => 'asdfasdf'} # TODO: This needs to be moved to config
  end

  def self.admin_load_path(method, city_account_id, city_user_id, extended_path, params = {})
    path = "#{THE_CITY_ADMIN_PATH}/accounts/#{city_account_id}/users/#{city_user_id}/#{extended_path}.json"
    self.typhoeus_request(method, path, params)
  end


  def self.typhoeus_request(method, path, params)
    case method 
    when :post
      Typhoeus::Request.post(path, {:headers => self.epistle_headers, :params => self.flatten_params(params)}).body
    when :get
      Typhoeus::Request.get(path, {:headers => self.epistle_headers, :params => self.flatten_params(params)}).body
    when :put
      Typhoeus::Request.put(path, {:headers => self.epistle_headers, :params => self.flatten_params(params)}).body
    when :delete
      Typhoeus::Request.delete(path, {:headers => self.epistle_headers, :params => self.flatten_params(params)}).body
    end
  end


  def self.flatten_params(params)
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

end


