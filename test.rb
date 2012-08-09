# *******************************************
# This is a demo file to show usage.
#
# @package TheCity::Admin
# @authors Robbie Lieb <robbie@onthecity.org>, Wes Hays <wes@onthecity.org>
# ******************************************* 

require 'ruby-debug'
require File.dirname(__FILE__) + '/lib/the_city_admin.rb'

# staging
# key = 'bc6b57204b0ee4818bb4b3befd0f3292e93a2d0a'
# token = '7cfed59b037125d3' 

# Local
key = '6db4c76b5e8fb6ef09055eeaa4b977326c70c371'
token = 'e43ab88416b3b5b7'

TheCity::AdminApi.connect(key, token)


# user_list = TheCity::UserList.new

# user_list.each do |user|

# user = user_list.first
# puts user.full_name

#   puts "------------------------------------"

#   if user.addresses.empty?
#     puts "No addresses for user"
#   else
#     puts "Addresses: #{user.addresses.size}"
#   end

#   puts "------------------------------------"

#   if user.admin_privileges.empty?
#     puts "No admin admin privileges for user"
#   else
#     puts "Admin privileges: #{user.admin_privileges.count}"
#   end

#   puts "------------------------------------"

#   if user.family.empty?
#     puts "No family members for user"
#   else
#     puts user.family.names
#   end

#   puts "------------------------------------"

#   if user.invitations.empty?
#     puts "No invitations for user"
#   else
#     puts "Invitations: #{user.invitations.count}"
#   end

#   puts "------------------------------------"

#   if user.notes.empty?
#     puts "No notes for user"
#   else
#     puts "Notes: #{user.notes.count}"
#   end

#   puts "------------------------------------"

#   if user.processes.empty?
#     puts "No processes for user"
#   else
#     puts "Processes: #{user.processes.count}"
#   end

#   puts "------------------------------------"

#   if user.roles.empty?
#     puts "No roles for user"
#   else
#     puts user.roles.all_roles
#   end

#   puts "------------------------------------"

#   if user.skills.empty?
#     puts "No skills for user"
#   else
#     puts user.skills.all_skills
#   end

#   puts "####################################"

# end


group_list = TheCity::GroupList.new

#group_list.each do |group|

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

  # if group.events.empty?
  #   puts "No events for group"
  # else
  #   puts "Events: #{group.events.size}"
  # end

  # puts "------------------------------------"

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
#end

