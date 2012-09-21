# *******************************************
# This is a demo file to show usage.
#
# @package TheCity::Admin
# @authors Robbie Lieb <robbie@onthecity.org>, Wes Hays <wes@onthecity.org>
# ******************************************* 


require 'ruby-debug'
require File.dirname(__FILE__) + '/lib/the_city_admin.rb'

key = '132412341234123412341234'
token = 'asdf1234asdf1234'


TheCity::AdminApi.connect(key, token)


done = false
page = 1
count = 0

while !done
  group_list = TheCity::GroupList.new({:page => page})

  group_list.each do |group|
    count += 1
    puts "#{count}) #{group.name}"
  end

  if group_list.total_pages <= page
    done = true
  else
    page += 1
  end
end

