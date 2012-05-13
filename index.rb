# *******************************************
# This is a demo file to show usage.
#
# @package TheCity::Admin
# @authors Robbie Lieb <robbie@onthecity.org>, Wes Hays <wes@onthecity.org>
# ******************************************* 

require 'ruby-debug'
require File.dirname(__FILE__) + '/lib/the_city_admin.rb'


key = '6db4c76b5e8fb6ef09055eeaa4b977326c70c371'
token = 'e43ab88416b3b5b7' 


the_city = TheCity::AdminApi.new(key, token)

user = the_city.users[1]

puts user.full_name


user2 = TheCity::User.load_user_by_id(564114313)
puts user2.full_name