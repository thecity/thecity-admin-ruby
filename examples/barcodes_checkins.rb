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

barcode = TheCity::Barcode.load_by_id(12345)
if barcode.nil?
  puts 'Barcode not found'
else
  puts "Barcode: #{barcode.barcode}"
end


puts "------------------------------------"

checkin_list = TheCity::CheckinList.new
if checkin_list.empty?
  puts "No checkins in list"
else
  puts "Checkins: #{checkin_list.count}"
end

checkin_list_by_pager_number = TheCity::CheckinListByPagerNumber.new('111')
if checkin_list_by_pager_number.empty?
  puts "No checkins in list"
else
  puts "Checkins: #{checkin_list.count}"
end

checkin_list_by_callboard_number = TheCity::CheckinListByCallboardNumber.new('12345')
if checkin_list_by_callboard_number.empty?
  puts "No checkins in list"
else
  puts "Checkins: #{checkin_list.count}"
end

checkin = checkin_list[0]

checkin2 = TheCity::Checkin.load_by_id(checkin.id)
if checkin2.nil?
  puts 'Checkin not found'
else
  puts "Checkin: #{checkin2.barcode}"
end

puts "------------------------------------"

group_checkin_events_list = TheCity::GroupCheckinEventsList.new({:group_id => 49861013})
if group_checkin_events_list.empty?
  puts "No checkin events in list"
else
  puts "Group Checkin Events: #{group_checkin_events_list.count}"
end

puts "####################################"
