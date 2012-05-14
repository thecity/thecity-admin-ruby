# *******************************************
# This is a demo file to show usage.
#
# @package TheCity::Admin
# @authors Robbie Lieb <robbie@onthecity.org>, Wes Hays <wes@onthecity.org>
# ******************************************* 

require 'ruby-debug'
require File.dirname(__FILE__) + '/lib/the_city_admin.rb'


key = 'a345c682210a29b80c227573303674fce900650d'
token = '853d87fbcebb81f6' 


the_city = TheCity::AdminApi.new(key, token)

# user = the_city.users[1]
# puts user.full_name


# user2 = TheCity::User.load_user_by_id(564114313)
# puts user2.full_name

user = the_city.users[1]
puts user.full_name

# This is currenly returning a 404 if no family members are found
#puts user.family[0].name

puts user.notes[0].author
puts user.roles[0].group_name
puts user.skills[0].name

#puts user.processes[0].name

