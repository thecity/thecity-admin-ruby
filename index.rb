# *******************************************
# This is a demo file to show usage.
#
# @package TheCity::Admin
# @authors Robbie Lieb <robbie@onthecity.org>, Wes Hays <wes@onthecity.org>
# ******************************************* 

require 'ruby-debug'
require File.dirname(__FILE__) + '/lib/the_city_admin.rb'

key = 'cf2903151e3213e66fd8080c7d8b65b1d6ccdd31'
token = '5c88b32edda7653c'

TheCity::AdminApi.connect(key, token)

###### USERS / GROUPS #######


# puts "-----------------------------"

# user_list = TheCity::UserList.new

# user_list.each do |u|
#   puts u.full_name
# end

# puts "-----------------------------"

user = TheCity::User.new
user.title = 'Deacon'
user.first = 'James'
user.middle = 'Wesley'
user.last = 'Hays'
user.nickname = 'Wes'
user.gender = TheCity::User::Gender[:male]
user.email = 'wesasdf@onthecity.org'
user.staff = false
user.member_since = Time.now.strftime("%Y-%m-%d")
user.birthdate = '1980-09-27'
user.primary_phone = '775-111-2222'
user.primary_phone_type = TheCity::User::PhoneType[:mobile]
user.secondary_phone = '775-333-4444'
user.secondary_phone_type = TheCity::User::PhoneType[:home]
user.marital_status = TheCity::User::MaritalStatus[:married]
#user.primary_campus_id
#user.external_id_1
#user.external_id_2
#user.external_id_3

if user.save
  puts "User #{user.full_name} saved (#{user.id})"
else
  user.error_messages.each { |em| puts em }
end

user2 = TheCity::User.load_by_id(user.id)
user2.email = 'wesasdf2@onthecity.org'
user2.nickname = 'dog'

if user2.save
  puts "User #{user2.full_name} updated (#{user2.id})"
else
  user2.error_messages.each { |em| puts em }
end

if user.delete
  puts "User #{user.full_name} deleted (#{user.id})"
else
  puts "Something bad happened"
  #user.error_messages.each { |em| puts em }
end

# puts "-----------------------------"

# user_list = TheCity::UserList.new

# user = user_list[0]
# puts user.full_name
# user.first = 'Wes'
# puts user.full_name
# user.save
# puts user.id
# user2 = TheCity::User.load_user_by_id(user.id)
# puts user2.full_name

# group = the_city.groups[0]
# puts group.name
# group.name = 'Wes Group'
# puts group.name
# group.save
# group2 = TheCity::Group.load_group_by_id(group.id)
# puts group2.name


# This is currenly returning a 404 if no family members are found
# puts user.family[0].name

# puts user.addresses[0].location_type
# puts user.notes[0].author
# puts user.roles[0].group_name
# puts user.skills[0].name
# puts user.processes[0].name
# puts user.invitations[0].source
# puts user.admin_privileges[0].title




##### GROUPS #######

group_list = TheCity::GroupList.new

group = group_list[13]
puts "Group Name: #{group.name} (#{group.id})"

if group.roles.size == 0
  puts "No group roles found"
else
  puts group.roles[0].title
end

if group.tags.size == 0
  puts "No group tags found"
else
  puts group.tags[0].name
end

if group.invitations.size == 0
  puts "No group invitations found"
else
  puts group.invitations[0].id
end



