# *******************************************
# This is a demo file to show usage.
#
# @package TheCity::Admin
# @authors Robbie Lieb <robbie@onthecity.org>, Wes Hays <wes@onthecity.org>
# ******************************************* 

require File.dirname(__FILE__) + '/lib/the_city_admin.rb'


key = 'e1494732b298e39ba0dba69f6f61f219aea56e80'
token = '4fb47aec019cf5db' 


the_city = TheCity::AdminApi.new(key, token)


#the_city.users

require 'ruby-debug'
debugger
asdf=234