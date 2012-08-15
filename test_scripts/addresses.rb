# *******************************************
# This is a demo file to show usage.
#
# @package TheCity::Admin
# @authors Robbie Lieb <robbie@onthecity.org>, Wes Hays <wes@onthecity.org>
# ******************************************* 

require 'ruby-debug'
require File.dirname(__FILE__) + '/../lib/the_city_admin.rb'

# saddressing
# key = 'bc6b57204b0ee4818bb4b3befd0f3292e93a2d0a'
# token = '7cfed59b037125d3' 

# Local
key = '66c59e2ee24553e7237259e30b4c17365681b95c'
token = 'a9ae4af3c3e80102'

TheCity::AdminApi.connect(key, token)


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
