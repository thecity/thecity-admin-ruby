# *******************************************
# This is a demo file to show usage.
#
# @package TheCity::Admin
# @authors Robbie Lieb <robbie@onthecity.org>, Wes Hays <wes@onthecity.org>
# ******************************************* 

require 'ruby-debug'
require File.dirname(__FILE__) + '/../lib/the_city_admin.rb'

require File.dirname(__FILE__) + '/city_keys.rb'
include CityKeys

TheCity::AdminApi.connect(KEY, TOKEN)

group_list = TheCity::GroupList.new

group = group_list.first
puts group.name

puts "------------------------------------"

if group.addresses.empty?
  puts "No addresses for group"
else
  puts "Addresses: #{group.addresses.size}"
end

address = TheCity::GroupAddress.new
address.group_id = group.id
address.location_type = 'Work'
address.street = '445 S. Virginia St'
address.city = 'Reno'
address.state = 'NV'
address.zipcode = '89501'
if address.save
  puts "Address saved: #{address.id}"
else
  uts "** Unable to create address: #{address.error_messages.join(', ')}"
end


address.street = '663 Beckwourth Dr'

if address.save
  puts "Address updated: #{address.id}"
else
  puts "** Unable to update address: #{address.error_messages.join(', ')}"
end


if group.addresses(true).empty?
  puts "No addresses for group"
else
  puts "Addresses: #{group.addresses.size}"
end

group.addresses.each do |address| 
  if address.delete 
    puts "Address #{address.id} deleted"
  else
    puts "Unable to delete address #{address.id}: #{address.error_messages.join(', ')}"
  end
end

if group.addresses(true).empty?
  puts "No addresses for group"
else
  puts "Addresses: #{group.addresses.size}"
end

puts "------------------------------------"

# if group.checkins.empty?
#   puts "No checkins for group"
# else
#   puts "Checkins: #{group.checkins.size}"
# end

# puts "------------------------------------"

# if group.event_attendances.empty?
#   puts "No event attendances for group"
# else
#   puts "Events: #{group.event_attendances.size}"
# end

# puts "------------------------------------"

# if group.exports.empty?
#   puts "No exports for group"
# else
#   puts "Exports: #{group.exports.size}"
# end

# puts "------------------------------------"

# if group.invitations.empty?
#   puts "No invitations for group"
# else
#   puts "Invitations: #{group.invitations.size}"
# end

# puts "------------------------------------"

# if group.roles.empty?
#   puts "No roles for group"
# else
#   puts "Roles: #{group.roles.size}"
# end

# puts "------------------------------------"

# if group.tags.empty?
#   puts "No tags for group"
# else
#   puts "Tags: #{group.tags.size}"
# end

puts "------------------------------------"

puts "####################################"


