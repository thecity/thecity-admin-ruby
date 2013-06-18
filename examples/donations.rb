# *******************************************
# This is a demo file to show usage.
#
# @package TheCity::Admin
# @authors Robbie Lieb <robbie@onthecity.org>, Wes Hays <wes@onthecity.org>
# ******************************************* 

TCA_ENV = 'development' 
THE_CITY_ADMIN_PATH = 'http://api.devthecity.org:9292' 
key = '6910f0d2654c7704ceb3af054f52294db67b23ee'
token = '3eaf0b8b967dde78'


require 'ruby-debug'
require File.dirname(__FILE__) + '/../lib/the_city_admin.rb'

require File.dirname(__FILE__) + '/city_keys.rb'
include CityKeys

TheCity::AdminApi.connect(KEY, TOKEN)


de_list = TheCity::DonationList.new
de_list.each do |item|
  puts "DonationExport: #{item.inspect}"
end


puts "------------------------------------"

puts "####################################"


