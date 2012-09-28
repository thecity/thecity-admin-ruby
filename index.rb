# *******************************************
# This is a demo file to show usage.
#
# @package TheCity::Admin
# @authors Robbie Lieb <robbie@onthecity.org>, Wes Hays <wes@onthecity.org>
# ******************************************* 

TCA_ENV = 'development' 
THE_CITY_ADMIN_PATH = 'http://localhost:9292' 

require 'ruby-debug'
require File.dirname(__FILE__) + '/lib/the_city_admin.rb'

key = '66c59e2ee24553e7237259e30b4c17365681b95c'
token = 'a9ae4af3c3e80102'

# key = '2bcee1fdccd31f1ef35a7c6708daf5a446a61ee3'
# token = 'e37ae7fb2042a17b'

TheCity::AdminApi.connect(key, token)


puts "-----------------------------"
puts "##### PLEDGES #######"
puts "-----------------------------"


pledge_list = TheCity::PledgeList.new({:page => 1})
#puts pledge_list.names

pledge = pledge_list[0]
puts pledge.amount


# done = false
# page = 1
# count = 0

# while !done
#   group_list = TheCity::GroupList.new({:page => page, :group_types => 'CG', :include_inactive => true})

#   group_list.each do |group|
#     count += 1
#     puts "#{count}) #{group.name}"
#   end

#   if group_list.total_pages <= page
#     done = true
#   else
#     page += 1
#   end
# end


# done = false
# page = 1
# count = 0

# while !done
#   tag_list = TheCity::TagList.new({:page => page})
  
#   tag_list.each do |tag|
#     count += 1
#     puts "#{count}) #{tag.name} :: #{tag.id}"
#   end

#   if tag_list.total_pages <= page
#     done = true
#   else
#     page += 1
#   end
# end





# puts "-----------------------------"
# puts "##### USERS #######"
# puts "-----------------------------"


# user_list = TheCity::UserList.new

# user_list.each do |u|
#   puts u.full_name
# end

# puts "-----------------------------"

# user = TheCity::User.new
# user.title = 'Deacon'
# user.first = 'James'
# user.middle = 'Wesley'
# user.last = 'Hays'
# user.nickname = 'Wes'
# user.gender = TheCity::User::Gender[:male]
# user.email = 'someguy@somewhere.org'
# user.staff = false
# user.member_since = Time.now.strftime("%Y-%m-%d")
# user.birthdate = '1980-09-27'
# user.primary_phone = '775-111-2222'
# user.primary_phone_type = TheCity::User::PhoneType[:mobile]
# user.secondary_phone = '775-333-4444'
# user.secondary_phone_type = TheCity::User::PhoneType[:home]
# user.marital_status = TheCity::User::MaritalStatus[:married]
# #user.primary_campus_id
# #user.external_id_1
# #user.external_id_2
# #user.external_id_3

# if user.save
#   puts "User #{user.full_name} saved (#{user.id})"
# else
#   user.error_messages.each { |em| puts em }
# end

# user2 = TheCity::User.load_by_id(user.id)
# user2.email = 'somegirl@somewhere.org'
# user2.nickname = 'dog'

# if user2.save
#   puts "User #{user2.full_name} updated (#{user2.id})"
# else
#   user2.error_messages.each { |em| puts em }
# end

# if user.delete
#   puts "User #{user.full_name} deleted (#{user.id})"
# else
#   puts "Something bad happened"
#   #user.error_messages.each { |em| puts em }
# end


# puts "-----------------------------"

# user_list = TheCity::UserList.new

# user = user_list[0]
# puts user.full_name
# user.first = 'Wes'
# puts user.full_name
# user.save
# puts user.id

# user2 = TheCity::User.load_by_id(user.id)
# puts user2.full_name

# puts "User has #{user.addresses.size} addresses"
# puts "User has #{user.family.size} family members"
# puts "User has #{user.notes.size} notes"
# puts "User has #{user.roles.size} roles"
# puts "User has #{user.skills.size} skills"
# #puts "User has #{user.processes.size} processes"
# puts "User has #{user.invitations.size} invitations"
# #puts "User has #{user.admin_privileges.size} admin_privileges"


# This is currenly returning a 404 if no family members are found
# puts user.family[0].name



# puts "-----------------------------"


# group_list = TheCity::GroupList.new(:)
# puts group.name
# group.name = 'Wes Group'
# puts group.name
# group.save
# group2 = TheCity::Group.load_by_id(group.id)
# puts group2.name


# puts "-----------------------------"
# puts "##### GROUPS #######"
# puts "-----------------------------"

# group_list = TheCity::GroupList.new

# group = group_list[13]
# puts "Group Name: #{group.name} (#{group.id})"

# if group.roles.size == 0
#   puts "No group roles found"
# else
#   puts group.roles[0].title
# end

# if group.tags.size == 0
#   puts "No group tags found"
# else
#   puts group.tags[0].name
# end

# if group.invitations.size == 0
#   puts "No group invitations found"
# else
#   puts group.invitations[0].id
# end


# puts "-----------------------------"
# puts "##### SKILLS #######"
# puts "-----------------------------"

# skill_list = TheCity::SkillList.new

# puts skill_list.inspect

# # skill_list.each do |skill|
# #   puts skill.name
# # end


# puts "-----------------------------"
# puts "##### USERS #######"
# puts "-----------------------------"

# done = false
# page = 1


# while !done
#   user_list = TheCity::UserList.new({:page => page})

#   user_list.each do |user|
#     puts user.full_name
#   end

#   if user_list.total_pages <= page
#     done = true
#   else
#     page += 1
#   end
# end

