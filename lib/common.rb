module TheCity
  require 'cgi'

  def self.admin_request(method, path, params = {})    
    # data_params = params.inject({}) {|h, (k,v)| h.update({k => v.nil? ? v : v.to_s})}
    # flattened_params = self._flatten_params(data_params)

    flattened_params = self._flatten_params(params)

# puts "############################"
# puts "flattened_params: #{flattened_params}"
# puts "############################"

    headers = self._build_admin_headers(method, path, flattened_params) 
    url = THE_CITY_ADMIN_PATH+path

    response = 
    case method 
    when :post
      Typhoeus::Request.post(url, {:headers => headers, :params => flattened_params})
    when :get  
      Typhoeus::Request.get(url, {:headers => headers, :params => flattened_params})
    when :put  
      Typhoeus::Request.put(url, {:headers => headers, :params => flattened_params})
    when :delete      
      Typhoeus::Request.delete(url, {:headers => headers, :params => flattened_params})
    end

    unless response.success?
      if response.curl_error_message != 'No error'
        raise TheCityExceptions::UnableToConnectToTheCity.new(response.curl_error_message)
      else
        begin
          error_messages = JSON.parse(response.body)['error_message']
        rescue
          raise TheCityExceptions::UnknownErrorConnectingToTheCity.new('Unknown error when connecting to The City')
        else
          raise TheCityExceptions::TheCityResponseError.new(error_messages)
        end
      end
    end

    response
  end


  def self._flatten_params(params, prefix='')
    retval = []
    if params.instance_of?(Array)
      if params.empty?
        retval << self._flatten_params('', "#{prefix.to_s}[0]")
      else
        params.each_with_index do |value, indx|
          retval << self._flatten_params(value, "#{prefix.to_s}[#{indx}]")
        end
      end
    elsif params.instance_of?(Hash)
      params.each do |key, value|
        retval << self._flatten_params(value, prefix.empty? ? key.to_s : "#{prefix}[#{key.to_s}]")
      end
    else # assume string
      retval << "#{prefix}=#{params}"
    end

    if prefix.empty?
      hvals = {}
      retval.flatten.sort.each { |v| hvals[v.split('=')[0]] = v.split('=')[1] }
      hvals
    else  
      retval.flatten.sort
    end
    #retval.flatten.sort
  end



  def self._build_admin_headers(method, path, params) 
    # get_vars = '?' + params.to_a.sort.collect { |kv_pair| "#{kv_pair[0]}=#{kv_pair[1]}" }.join('&')
    # get_vars = '' if get_vars == '?'


    get_vars = '?' + params.to_a.sort.collect { |kv_pair| 
      if kv_pair[1].class == Array
        puts "ARRAY"
        kv_pair[1].each_with_index do |v, indx|
          "#{kv_pair[0]}[#{indx}]=#{v}" 
        end
      else
        "#{kv_pair[0]}=#{kv_pair[1]}" 
      end
    }.join('&')
    get_vars = '' if get_vars == '?'


# puts "############################"
# puts "params: #{params}"
# puts '------------'
# puts "get_vars: #{get_vars}"
# puts "############################"

    method_request = method.to_s.upcase
    url = THE_CITY_ADMIN_PATH + path + get_vars
    current_time = Time.now.to_i.to_s
    string_to_sign = current_time.to_s + method_request + url
    unencoded_hmac = OpenSSL::HMAC.digest('sha256', TheCity::AdminApi::API_KEY, string_to_sign)
    unescaped_hmac = Base64.encode64(unencoded_hmac).chomp
    hmac_signature = CGI.escape(unescaped_hmac)

    headers = {'X-City-Sig' => hmac_signature,
               'X-City-User-Token' => TheCity::AdminApi::API_TOKEN,
               'X-City-Time' => current_time,
               'Accept' => 'application/vnd.thecity.admin.v1+json'}


    # This is causing issues.... not sure if it is needed (docs might be lieing)
    # if [:post, :put].include?(method)
    #   headers['Content-Type'] = 'application/json'
    #   headers['Content-Length'] = params.to_json.length
    # end

    headers
  end  

end
