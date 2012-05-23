module TheCity

  def self.admin_request(method, path, params = {})
    headers = self._build_admin_headers(method, path, params) 
    url = THE_CITY_ADMIN_PATH+path

    response = 
    case method 
    when :post
      Typhoeus::Request.post(url, {:headers => headers, :params => self._flatten_params(params)})
    when :get  
      Typhoeus::Request.get(url, {:headers => headers, :params => self._flatten_params(params)})
    when :put  
      Typhoeus::Request.put(url, {:headers => headers, :params => self._flatten_params(params)})
    when :delete
      Typhoeus::Request.delete(url, {:headers => headers, :params => self._flatten_params(params)})
    end

    unless response.success?
      if response.curl_error_message != 'No error'
        raise TheCityExceptions::UnableToConnectToTheCity.new(response.curl_error_message)
      else
        raise TheCityExceptions::TheCityResponseError.new(response.status_message)
      end
    end
    
    response.body
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


  def self._build_admin_headers(method, path, params) 
    get_vars = '?' + params.to_a.sort.collect { |kv_pair| "#{kv_pair[0]}=#{kv_pair[1]}" }.join('&')
    get_vars = '' if get_vars == '?'
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
