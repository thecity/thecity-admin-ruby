require 'Base64'
require 'CGI'
require 'openssl'
require 'net/http'
require 'net/https'

key = 'e1494732b298e39ba0dba69f6f61f219aea56e80'
token = '4fb47aec019cf5db' 
path = '/groups'
url = 'http://api.devthecity.org:3000' + path
current_time = Time.now.to_i.to_s
string_to_sign = current_time.to_s + 'GET' + url
unencoded_hmac = OpenSSL::HMAC.digest('sha256', key, string_to_sign)
unescaped_hmac = Base64.encode64(unencoded_hmac).chomp
hmac_signature = CGI.escape(unescaped_hmac)
http = Net::HTTP.new('api.devthecity.org', 3000)
#http.use_ssl = true
headers = {}
headers['X-City-Sig'] = hmac_signature
headers['X-City-User-Token'] = token
headers['X-City-Time'] = current_time
headers['Accept'] = 'application/vnd.thecity.v1+json'
response = http.get(path, headers)
#puts response.body
puts response


