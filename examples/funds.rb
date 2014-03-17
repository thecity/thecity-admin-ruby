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

fund_options = {:include_inactive => 'true', :show_give_online_only => 'false'}
page = 1

fund_list = TheCity::FundList.new({:page => page}.merge(fund_options))
fund_list.each do |item|
  puts "FundList: #{item.inspect}"
end


puts "------------------------------------"

puts "####################################"


