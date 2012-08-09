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
key = '6db4c76b5e8fb6ef09055eeaa4b977326c70c371'
token = 'e43ab88416b3b5b7'

TheCity::AdminApi.connect(key, token)

group_list = TheCity::GroupList.new

group = group_list.first
puts group.name

puts "------------------------------------"

if group.addresses.empty?
  puts "No addresses for group"
else
  puts "Addresses: #{group.addresses.size}"
end

puts "------------------------------------"

if group.checkins.empty?
  puts "No checkins for group"
else
  puts "Checkins: #{group.checkins.size}"
end

puts "------------------------------------"

if group.event_attendances.empty?
  puts "No event attendances for group"
else
  puts "Events: #{group.event_attendances.size}"
end

puts "------------------------------------"

if group.exports.empty?
  puts "No exports for group"
else
  puts "Exports: #{group.exports.size}"
end

puts "------------------------------------"

if group.invitations.empty?
  puts "No invitations for group"
else
  puts "Invitations: #{group.invitations.size}"
end

puts "------------------------------------"

if group.roles.empty?
  puts "No roles for group"
else
  puts "Roles: #{group.roles.size}"
end

puts "------------------------------------"

if group.tags.empty?
  puts "No tags for group"
else
  puts "Tags: #{group.tags.size}"
end

puts "------------------------------------"

puts "####################################"


