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

puts '--- USER ROLE SETUP ---'
group_list = TheCity::GroupList.new
group = group_list.first

offline_user = TheCity::User.new
offline_user.first = 'Wes'
offline_user.last = 'Hays'
offline_user.email = 'someguy@someplace.org'
if offline_user.save
  puts "Offline user created #{offline_user.id}"
else
   puts "Failed to create offline user: #{offline_user.error_messages.join(', ')}"
end

if offline_user.roles.empty?
  puts "No roles for user"
else
  puts "Roles: #{offline_user.roles.size}"
end

role = TheCity::UserRole.new
role.group_type = TheCity::UserRole::GroupTypes[:campus]
role.title = TheCity::UserRole::Titles[:leader]
role.user_id = offline_user.id
role.group_id = group.id

if role.save
  puts "Role saved"
else
  puts "** Unable to save new role: #{role.error_messages.join(', ')}"
end
puts '--- USER ROLE SETUP DONE ---'




role_list = TheCity::RoleList.new
if role_list.empty?
  puts "No roles in list"
else
  puts "Roles: #{role_list.count}"
end




puts '--- USER ROLE TEARDOWN ---'
if offline_user.roles(true).empty?
  puts "No roles for user"
else
  puts "Roles: #{user.roles.size}"
end

offline_user.roles.each do |role| 
  if role.delete 
    puts "Role #{role.id} deleted"
  else
    puts "Unable to delete role #{role.id}: #{role.error_messages.join(', ')}"
  end
end

if offline_user.roles(true).empty?
  puts "No roles for user"
else
  puts "Roles: #{user.roles.size}"
end

if offline_user.delete 
  puts "OfflineUser #{offline_user.id} deleted"
else
  puts "Unable to delete offline user #{offline_user.id}: #{offline_user.error_messages.join(', ')}"
end
puts '--- USER ROLE TEARDOWN DONE ---'


puts "####################################"
