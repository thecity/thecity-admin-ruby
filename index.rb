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
key = '66c59e2ee24553e7237259e30b4c17365681b95c'
token = 'a9ae4af3c3e80102'


TheCity::AdminApi.connect(key, token)

###### USERS / GROUPS #######

puts "-----------------------------"

user = TheCity::User.new
user.title = 'Deacon'
user.first = 'James'
user.middle = 'Wesley'
user.last = 'Hays'
user.nickname = 'Wes'
user.gender = TheCity::User::Gender[:male]
user.email = 'wes+tc6@onthecity.org'
user.staff = false
user.member_since = Time.now.strftime("%Y-%m-%d")
user.birthdate = '1980-09-27'
user.primary_phone = '775-745-3013'
user.primary_phone_type = TheCity::User::PhoneType[:mobile]
user.secondary_phone = '775-677-7707'
user.secondary_phone_type = TheCity::User::PhoneType[:home]
#user.marital_status = TheCity::User::MaritalStatus[:married]
#user.primary_campus_id
#user.external_id_1
#user.external_id_2
#user.external_id_3
unless user.save
  user.error_messages.each { |em| puts em }
end

user.delete


# puts "-----------------------------"


# user = the_city.users[0]
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




###### USERS #######

# user = the_city.users[0]
# puts user.full_name


# user2 = TheCity::User.load_user_by_id(1068169470) #(564114313)
# puts user2.full_name

# user = the_city.users[1]
# puts user.full_name

# This is currenly returning a 404 if no family members are found
# puts user.family[0].name

# puts user.addresses[0].location_type
# puts user.notes[0].author
# puts user.roles[0].group_name
# puts user.skills[0].name
# puts user.processes[0].name
# puts user.invitations[0].source
# puts user.admin_privileges[0].title


###### GROUPS #######

# group = the_city.groups[0]
# puts group.name
# puts group.id

# Fails with 500 error
# puts group.addresses[0].location_type

# puts group.roles[0].user_name
# puts group.tags[0].name

# puts group.invitations[0].source

# metric = the_city.metrics[0]

# puts metric.name
# metric.measurements.total_entries.times do |i|
#   puts "#{metric.measurements[i].created_at}: #{metric.measurements[i].value}"
# end
# new_measurement = TheCity::MetricMeasurement.new(:id => metric.id, :value => 999)
# new_measurement.save


