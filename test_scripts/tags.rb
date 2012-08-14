# *******************************************
# This is a demo file to show usage.
#
# @package TheCity::Admin
# @authors Robbie Lieb <robbie@onthecity.org>, Wes Hays <wes@onthecity.org>
# ******************************************* 

require 'ruby-debug'
require File.dirname(__FILE__) + '/../lib/the_city_admin.rb'

# staging
# key = 'bc6b57204b0ee4818bb4b3befd0f3292e93a2d0a'
# token = '7cfed59b037125d3' 

# Local
key = '66c59e2ee24553e7237259e30b4c17365681b95c'
token = 'a9ae4af3c3e80102'

TheCity::AdminApi.connect(key, token)


puts "------------------------------------"

tag_list = TheCity::TagList.new
if tag_list.empty?
  puts "No tags in list"
else
  puts "Tags: #{tag_list.count}"
end

tag = TheCity::Tag.new
tag.name = 'WesHays'
if tag.save
  puts "Tag created (#{tag.id})"
else
  puts "Failed to create tag: #{tag.error_messages.join(', ')}"
end


tag_list2 = TheCity::TagList.new
if tag_list2.empty?
  puts "No tags in list"
else
  puts "Tags: #{tag_list2.count}"
end

if tag.delete 
  puts "Tag #{tag.id} deleted"
else
  puts "Unable to delete tag #{tag.id}: #{tag.error_messages.join(', ')}"
end

tag_list3 = TheCity::TagList.new
if tag_list2.empty?
  puts "No tags in list"
else
  puts "Tags: #{tag_list3.count}"
end

puts "####################################"
