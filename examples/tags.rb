# *******************************************
# This is a demo file to show usage.
#
# @package TheCityAdmin::Admin
# @authors Robbie Lieb <robbie@onthecity.org>, Wes Hays <wes@onthecity.org>
# ******************************************* 

require 'ruby-debug'
require File.dirname(__FILE__) + '/../lib/the_city_admin.rb'

require File.dirname(__FILE__) + '/city_keys.rb'
include CityKeys

TheCityAdmin::AdminApi.connect(KEY, TOKEN)


puts "------------------------------------"

tag_list = TheCityAdmin::TagList.new
puts "Tags: #{tag_list.total_entries}"


puts "*******************"
tag = TheCityAdmin::Tag.new
tag.name = 'zProgrammer'

if tag.save
  puts "Tag SAVED"
else
  puts "FAILED TO SAVE TAG: #{tag.error_messages}"
end
puts "*******************"

tag_list = TheCityAdmin::TagList.new
puts "Tags: #{tag_list.total_entries}"

puts "*******************"
tag.name = 'zProgrammer 2'

if tag.save
  puts "Tag Updated"
else
  puts "FAILED TO SAVE TAG: #{tag.error_messages}"
end
puts "*******************"


puts "*******************"
if tag.delete
  puts "Tag Deleted"
else
  puts "FAILED TO DELETE TAG: #{tag.error_messages}"
end
puts "*******************"


tag_list = TheCityAdmin::TagList.new
puts "Tags: #{tag_list.total_entries}"


puts "####################################"
