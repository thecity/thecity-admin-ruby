require 'Base64'
require 'CGI'
require 'openssl'
require 'net/http'
require 'net/https'
require 'json'


# The City API keys
key = '**** YOUR CITY API KEY ****'
token = '**** YOUR CITY API TOKEN ****'


# API endpoint to get data from
path = '/groups'
url = 'https://api.onthecity.org' + path


# Build signature
current_time = Time.now.to_i.to_s
string_to_sign = current_time.to_s + 'GET' + url
unencoded_hmac = OpenSSL::HMAC.digest('sha256', key, string_to_sign)
unescaped_hmac = Base64.encode64(unencoded_hmac).chomp
hmac_signature = CGI.escape(unescaped_hmac)


# Build headers
headers = {}
headers['X-City-Sig'] = hmac_signature
headers['X-City-User-Token'] = token
headers['X-City-Time'] = current_time
headers['Accept'] = 'application/vnd.thecity.admin.v1+json'
headers['Content-Type'] = 'application/json'


# API Request
uri = URI.parse(url)
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE # read into this
request = Net::HTTP::Get.new(uri.request_uri, headers)
response = http.request(request)
groups_data = JSON.parse(response.body)


# Output group names
groups_data['groups'].each do |group| 
  puts group['name']
end