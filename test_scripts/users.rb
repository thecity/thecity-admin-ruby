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
key = 'a345c682210a29b80c227573303674fce900650d'
token = '853d87fbcebb81f6'

TheCity::AdminApi.connect(key, token)


user_list = TheCity::UserList.new

user = user_list.first
puts user.full_name

# puts "------------------------------------"

# if user.addresses.empty?
#   puts "No addresses for user"
# else
#   puts "Addresses: #{user.addresses.size}"
# end

# address = TheCity::UserAddress.new
# address.user_id = user.id
# address.location_type = 'Work'
# address.street = '445 S. Virginia St'
# address.city = 'Reno'
# address.state = 'NV'
# address.zipcode = '89501'
# if address.save
#   puts "Address saved"
# else
#   puts "** Unable to save new address"
# end

# if user.addresses(true).empty?
#   puts "No addresses for user"
# else
#   puts "Addresses: #{user.addresses.size}"
# end

# user.addresses.each do |address| 
#   if address.delete 
#     puts "Address #{address.id} deleted"
#   else
#     puts "Unable to delete address #{address.id}"
#   end
# end

# if user.addresses(true).empty?
#   puts "No addresses for user"
# else
#   puts "Addresses: #{user.addresses.size}"
# end


# puts "------------------------------------"

# if user.admin_privileges.empty?
#   puts "No admin admin privileges for user"
# else
#   puts "Admin privileges: #{user.admin_privileges.count}"
# end

# privilege = TheCity::UserAdminPrivilege.new
# privilege.title = TheCity::UserAdminPrivilege::Permissions[:resource_admin]
# privilege.user_id = user.id

# if privilege.save
#   puts "Privilege saved"
# else
#   puts "** Unable to save new privilege"
# end

# if user.admin_privileges(true).empty?
#   puts "No admin admin privileges for user"
# else
#   puts "Admin privileges: #{user.admin_privileges.count}"
# end

# puts "------------------------------------"

# puts "ADD CHECK FOR FAMILY"
# # if user.family.empty?
# #   puts "No family members for user"
# # else
# #   puts user.family.names
# # end

# puts "------------------------------------"

#### THIS SEEMS TO NOT BE WORKING RIGHT
# After post the invitation is saved but it is not in the database.

# if user.invitations.empty?
#   puts "No invitations for user"
# else
#   puts "Invitations: #{user.invitations.count}"
# end

# group_list = TheCity::GroupList.new
# group = group_list.first

# invitation = TheCity::UserInvitation.new
# invitation.user_id = user.id
# invitation.email = user.email
# invitation.group_id = group.id
# invitation.custom_message = 'Please join the group!'

# if invitation.save
#   puts "Invitation saved"
# else
#   puts "** Unable to save new invitation"
# end

# if user.invitations(true).empty?
#   puts "No invitations for user"
# else
#   puts "Invitations: #{user.invitations.count}"
# end

# puts "------------------------------------"

# if user.notes.empty?
#   puts "No notes for user"
# else
#   puts "Notes: #{user.notes.count}"
# end


# note = TheCity::UserNote.new
# note.author_id = user.id
# note.body = "Hello World"
# #note.visible_to = [TheCity::UserNote::VisibleTo[:process_user], TheCity::UserNote::VisibleTo[:resource_admin]]

# if note.save
#   puts "Note saved"
# else
#   puts "** Unable to save new note"
# end

# if user.notes(true).empty?
#   puts "No notes for user"
# else
#   puts "Notes: #{user.notes.count}"
# end

# user.notes.each do |note| 
#   if note.delete 
#     puts "Note #{note.id} deleted"
#   else
#     puts "Unable to delete note #{note.id}"
#   end
# end

# if user.notes(true).empty?
#   puts "No notes for user"
# else
#   puts "Notes: #{user.notes.count}"
# end


# puts "------------------------------------"

# if user.processes.empty?
#   puts "No processes for user"
# else
#   puts "Processes: #{user.processes.count}"
# end

# puts "------------------------------------"

# group_list = TheCity::GroupList.new
# group = group_list.first

# offline_user = TheCity::User.new
# offline_user.first = 'Wes'
# offline_user.last = 'Hays'
# offline_user.email = 'someguy@someplace.org'
# if offline_user.save
#   puts "Offline user created"
# else
#    puts "Failed to create offline user"
# end

# if user.roles.empty?
#   puts "No roles for user"
# else
#   puts "Roles: #{user.roles.size}"
# end

# role = TheCity::UserRole.new
# role.group_type = TheCity::UserRole::GroupTypes[:campus]
# role.title = TheCity::UserRole::Titles[:leader]
# role.user_id = offline_user.id
# role.group_id = group.id

# if role.save
#   puts "Role saved"
# else
#   puts "** Unable to save new role: #{role.error_messages.join(', ')}"
# end

# if user.roles(true).empty?
#   puts "No roles for user"
# else
#   puts "Roles: #{user.roles.size}"
# end

# user.roles.each do |role| 
#   if role.delete 
#     puts "Role #{role.id} deleted"
#   else
#     puts "Unable to delete role #{role.id}: #{role.error_messages.join(', ')}"
#   end
# end

# if user.roles(true).empty?
#   puts "No roles for user"
# else
#   puts "Roles: #{user.roles.size}"
# end

# if offline_user.delete 
#   puts "OfflineUser #{offline_user.id} deleted"
# else
#   puts "Unable to delete offline user #{offline_user.id}: #{offline_user.error_messages.join(', ')}"
# end

puts "------------------------------------"

if user.skills.empty?
  puts "No skills for user"
else
  puts "Skills: #{user.skills.size}"
end

skill_list = TheCity::SkillList.new
skill = skill_list.first

user_skill = TheCity::UserSkill.new
user_skill.user_id = user.id
user_skill.name = skill.name

if user_skill.save
  puts "User Skill saved"
else
  puts "** Unable to save new user skill (#{user_skill.skill_id}): #{user_skill.error_messages.join(', ')}"
end

if user.skills(true).empty?
  puts "No skills for user"
else
  puts "Skills: #{user.skills.size}"
end

user.skills(true).each do |us| 
  if us.delete 
    puts "User Skill #{us.name} deleted"
  else
    puts "Unable to delete user skill #{us.name}: #{us.error_messages.join(', ')}"
  end
end

if user.skills(true).empty?
  puts "No skills for user"
else
  puts "Skills: #{user.skills.size}"
end

puts "####################################"
