# *******************************************
# This is a demo file to show usage.
#
# @package TheCity::Admin
# @authors Robbie Lieb <robbie@onthecity.org>, Wes Hays <wes@onthecity.org>
# ******************************************* 

require 'ruby-debug'
require File.dirname(__FILE__) + '/../lib/the_city_admin.rb'

require File.dirname(__FILE__) + '/city_keys.rb'
include CityKeys

TheCity::AdminApi.connect(KEY, TOKEN)


puts "------------------------------------"

address_list = TheCity::AddressList.new
if address_list.empty?
  puts "No addresses in list"
else
  puts "Addresss: #{address_list.count}"
end

address = address_list[0]

address2 = TheCity::Address.load_by_id(address.id)

if address2.street == address.street
  puts "Address found (#{address.street})"
else
  puts "Failed to load address"
end

puts "####################################"
