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

barcode = TheCity::Barcode.load_by_id(12345)
if barcode.nil?
  puts 'Barcode not found'
else
  puts "Barcode: #{barcode.barcode}"
end


puts "------------------------------------"

checkin_list = TheCity::CheckinList.new
# if checkin_list.empty?
#   puts "No checkins in list"
# else
#   puts "Checkins: #{checkin_list.count}"
# end

# checkin = checkin_list[0]

# checkin2 = TheCity::Checkin.load_by_id(checkin.id)
# if checkin2.nil?
#   puts 'Checkin not found'
# else
#   puts "Checkin: #{checkin2.barcode}"
# end

puts "####################################"
