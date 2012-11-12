# *******************************************
# This is a demo file to show usage.
#
# @package TheCity::Admin
# @authors Robbie Lieb <robbie@onthecity.org>, Wes Hays <wes@onthecity.org>
# ******************************************* 

# TCA_ENV = 'development' 
# THE_CITY_ADMIN_PATH = 'http://api.devthecity.org:9292' 
# key = 'Dev Key'
# token = 'dev token'

key = 'YOUR KEY'
token = 'YOUR TOKEN'

require 'open-uri'
require 'csv'
require 'ruby-debug'
require File.dirname(__FILE__) + '/lib/the_city_admin.rb'

TheCity::AdminApi.connect(key, token)

# group_export = TheCity::GroupExport.new
# group_export.group_id = 73608
# if group_export.save
#   puts "Export created"
# else
#   puts "Export failed: #{group_export.error_messages.join(', ')}"
# end


# done = false
# page = 1
# count = 0

# while !done
#   export_list = TheCity::GroupExportList.new({:page => page, :group_id => 73608})
  
#   export_list.each do |export|
#     count += 1
#     puts "#{count}) #{export.id} :: #{export.state}"
#   end

#   if export_list.total_pages <= page
#     done = true
#   else
#     page += 1
#   end
# end

# export_list = TheCity::GroupExportList.new({:page => page, :group_id => 73608})
# group_export = export_list[0]
# puts group_export.inspect



group_export = TheCity::GroupExport.load_by_id(100996, {:group_id => 73608})
path = group_export.authenticated_s3_url

data = open(path).read()

CSV.parse(data, {:headers => true}).each do |row| 
  puts [row[2], row[4]].join(' ')
end


# puts "-----------------------------"
# puts "##### Web Hooks #######"
# puts "-----------------------------"

# web_hooks = TheCity::WebHookList.new({:page => 1})
# web_hooks.each do |hook|
#   puts hook.inspect
# end

# web_hook1 = TheCity::WebHook.new({:callback_uri => 'https://www.somedomain.com/city/callbacks/fund/create', 
#                                   :object => TheCity::WebHook::Objects[:fund],
#                                   :event => TheCity::WebHook::Events[:create]})

# web_hook2 = TheCity::WebHook.new({:callback_uri => 'https://www.somedomain.com/city/callbacks/pledge/create', 
#                                   :object => TheCity::WebHook::Objects[:pledge],
#                                   :event => TheCity::WebHook::Events[:create]})

# web_hook3 = TheCity::WebHook.new({:callback_uri => 'https://www.somedomain.com/city/callbacks/donation/create', 
#                                   :object => TheCity::WebHook::Objects[:donation],
#                                   :event => TheCity::WebHook::Events[:create]})

# puts web_hook1.save ? 'Web Hook saved' : 'Web Hook failed'
# puts web_hook2.save ? 'Web Hook saved' : 'Web Hook failed'
# puts web_hook3.save ? 'Web Hook saved' : 'Web Hook failed'

# web_hooks = TheCity::WebHookList.new({:page => 1})
# web_hooks.each do |hook|
#   puts hook.inspect
#   puts hook.delete
# end


# puts "-----------------------------"
# puts "##### Invitations #######"
# puts "-----------------------------"

# invitation_list = TheCity::InvitationList.new({:page => 1})

# invitation_list.each do |invitation|
#   puts invitation.inspect
# end

# puts "-----------------------------"
# puts "##### FUNDS / DONATIONS / PLEDGES #######"
# puts "-----------------------------"


# donation_list = TheCity::DonationList.new({:page => 1, :include_details => 1, :start_date => '2012-09-01', :end_date => '2012-09-30'})

# donation_list.each do |donation|
#   puts [donation.user_name, donation.amount].join(' :: ')
# end


# fund_list = TheCity::FundList.new({:page => 1})

# fund_list.each do |fund|
#   puts [fund.id, fund.name].join(' :: ')
# end

# sfund = TheCity::Fund.load_fund_by_id(fund_list.first.id)

# puts [sfund.id, sfund.name].join(' :-: ')

# done = false
# page = 1
# count = 0

# while !done
#   group_list = TheCity::GroupList.new({:page => page, :group_types => 'CG', :include_inactive => true})

#   group_list.each do |group|
#     count += 1
#     puts "#{count}) #{group.name} [#{group.group_type}]"
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

# tag_list = TheCity::TagList.new({:page => page})
# tag = tag_list[0]

# puts tag.name
# tag.name = "Wes Hays #{Random.rand(99999)}"
# if tag.save
#   puts "TAG SAVED"
# else
#   puts "TAG FAILED TO SAVE: #{tag.error_messages}"
# end





# puts "-----------------------------"
# puts "##### USERS #######"
# puts "-----------------------------"


# wes = TheCity::User.load_by_id(746076)

# wes.first = "Jim"
# if wes.save
#   puts "Wes Saved"
# else
#   puts "WES FAILED TO SAVE: #{wes.error_messages}"
# end


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

