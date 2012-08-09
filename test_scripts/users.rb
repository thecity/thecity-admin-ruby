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


user_list = TheCity::UserList.new

user = user_list.first
puts user.full_name

puts "------------------------------------"

if user.addresses.empty?
  puts "No addresses for user"
else
  puts "Addresses: #{user.addresses.size}"
end

puts "------------------------------------"

if user.admin_privileges.empty?
  puts "No admin admin privileges for user"
else
  puts "Admin privileges: #{user.admin_privileges.count}"
end

puts "------------------------------------"

puts "ADD CHECK FOR FAMILY"
# if user.family.empty?
#   puts "No family members for user"
# else
#   puts user.family.names
# end

puts "------------------------------------"

if user.invitations.empty?
  puts "No invitations for user"
else
  puts "Invitations: #{user.invitations.count}"
end

puts "------------------------------------"

if user.notes.empty?
  puts "No notes for user"
else
  puts "Notes: #{user.notes.count}"
end

puts "------------------------------------"

if user.processes.empty?
  puts "No processes for user"
else
  puts "Processes: #{user.processes.count}"
end

puts "------------------------------------"

if user.roles.empty?
  puts "No roles for user"
else
  puts user.roles.all_roles
end

puts "------------------------------------"

if user.skills.empty?
  puts "No skills for user"
else
  puts user.skills.all_skills
end

puts "####################################"
