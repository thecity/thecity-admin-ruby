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

tag_list = TheCity::TagList.new
if tag_list.empty?
  puts "No tags in list"
else
  puts "Tags: #{tag_list.count}"
end

tag = TheCity::Tag.new
tag.name = 'Z Cool Guy'
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

tag2 = TheCity::Tag.load_by_id(tag.id)
if tag2.nil?
  puts "Tag not found"
else
  puts "Tag found by ID #{tag.id}"
end


tag.name = 'Z Some Guy'
if tag.save
  puts "Tag updated (#{tag.id})"
else
  puts "Failed to update tag: #{tag.error_messages.join(', ')}"
end


if tag.delete 
  puts "Tag #{tag.id} deleted"
else
  puts "Unable to delete tag #{tag.id}: #{tag.error_messages.join(', ')}"
end

tag_list3 = TheCity::TagList.new
if tag_list3.empty?
  puts "No tags in list"
else
  puts "Tags: #{tag_list3.count}"
end

puts "####################################"
