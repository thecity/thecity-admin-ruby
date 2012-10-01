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


metric = TheCity::Metric.new
metric.name = "CoolThing#{Time.now.to_i}"
if metric.save
  puts "Metric created (#{metric.id})"
else
  puts "Failed to create metric: #{metric.error_messages.join(', ')}"
end


metric_list2 = TheCity::MetricList.new
if metric_list2.empty?
  puts "No metrics in list"
else
  puts "Metrics: #{metric_list2.count}"
end

metric2 = TheCity::Metric.load_by_id(metric.id)
if metric2.nil?
  puts "Metric not found"
else
  puts "Metric found by ID #{metric2.id}"
end


metric2.name = "HelloWorld#{Time.now.to_i}"
if metric2.save
  puts "Metric updated (#{metric2.id})"
else
  puts "Failed to update metric: #{metric2.error_messages.join(', ')}"
end


if metric2.delete 
  puts "Metric #{metric2.id} deleted"
else
  puts "Unable to delete metric #{metric2.id}: #{metric2.error_messages.join(', ')}"
end

metric_list3 = TheCity::MetricList.new
if metric_list3.empty?
  puts "No metrics in list"
else
  puts "Metrics: #{metric_list3.count}"
end

puts "####################################"
