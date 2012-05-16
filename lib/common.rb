module TheCity

  def self.admin_request(method, path, params = {})
    headers = self._build_admin_headers(method, path, params) 
    url = THE_CITY_ADMIN_PATH+path

    case method 
    when :post
      Typhoeus::Request.post(url, {:headers => headers, :params => self._flatten_params(params)}).body
    when :get  
      Typhoeus::Request.get(url, {:headers => headers, :params => self._flatten_params(params)}).body
    when :put
      Typhoeus::Request.put(url, {:headers => headers, :params => self._flatten_params(params)}).body
    when :delete
      Typhoeus::Request.delete(url, {:headers => headers, :params => self._flatten_params(params)}).body
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


  def self._build_admin_headers(method, path, params) 
    get_vars = '?' + params.collect { |key, value| "#{key}=#{value}" }.join('&')
    get_vars = '' if get_vars == '?'
    method_request = method.to_s.upcase
    url = THE_CITY_ADMIN_PATH + path + get_vars
    current_time = Time.now.to_i.to_s
    string_to_sign = current_time.to_s + method_request + url
    unencoded_hmac = OpenSSL::HMAC.digest('sha256', TheCity::AdminApi::API_KEY, string_to_sign)
    unescaped_hmac = Base64.encode64(unencoded_hmac).chomp
    hmac_signature = CGI.escape(unescaped_hmac)

    {'X-City-Sig' => hmac_signature,
     'X-City-User-Token' => TheCity::AdminApi::API_TOKEN,
     'X-City-Time' => current_time,
     'Accept' => 'application/vnd.thecity.admin.v1+json'}


     raise 'Still need to add the length'
  end  

end
