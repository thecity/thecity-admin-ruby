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

metric_list = TheCity::MetricList.new
if metric_list.empty?
  puts "No metrics in list"
else
  puts "Metrices: #{metric_list.count}"
end

measurement_list = TheCity::MetricMeasurementList.new({:metric_id => metric_list[0].id})
if metric_list.empty?
  puts "No measurements in list"
else
  puts "Measurements: #{measurement_list.count}"
end

puts "####################################"
