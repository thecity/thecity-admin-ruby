# *******************************************
# This is a demo file to show usage.
#
# @package TheCity::Admin
# @authors Robbie Lieb <robbie@onthecity.org>, Wes Hays <wes@onthecity.org>
# ******************************************* 

require 'ruby-debug'
require File.dirname(__FILE__) + '/../lib/the_city_admin.rb'

# sroleing
# key = 'bc6b57204b0ee4818bb4b3befd0f3292e93a2d0a'
# token = '7cfed59b037125d3' 

# Local
key = '66c59e2ee24553e7237259e30b4c17365681b95c'
token = 'a9ae4af3c3e80102'

TheCity::AdminApi.connect(key, token)


puts "------------------------------------"

family = TheCity::Family.load_by_id(398768686)

if family.nil?
  puts "Family found with #{family.members.size} members"
else
  puts "Family: #{family.id}"
end

# if family.save
#   puts "Family saved"
# else
#   puts "** Unable to save new family: #{family.error_messages.join(', ')}"
# end


# family..

# if family.save
#   puts "Family updated: #{family.id}"
# else
#   puts "** Unable to update family: #{family.error_messages.join(', ')}"
# end

# if family.delete 
#   puts "Family #{family.id} deleted"
# else
#   puts "Unable to delete family user #{family.id}: #{family.error_messages.join(', ')}"
# end


puts "####################################"
