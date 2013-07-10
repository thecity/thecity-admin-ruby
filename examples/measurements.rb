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


# The next line is the same as: TheCity::MetricMeasurementList.new({:metric_id => metric_list[0].id})
measurement_list = metric_list[0].measurements 
if metric_list.empty?
  puts "No measurements in list"
else
  puts "Measurements: #{measurement_list.count}"
end


# The next line is the same as: TheCity::MetricMeasurementValues.new({:metric_id => metric_list[0].id})
values = metric_list[0].measurement_values
if values.empty?
  puts "No values returned"
else
  puts "Measurement values: #{values.count}"
  values.each_with_index { |value, indx| puts "#{indx+1}) #{value}" }
end

puts "####################################"
