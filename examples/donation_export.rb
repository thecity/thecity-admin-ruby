# *******************************************
# This is a demo file to show usage.
#
# @package TheCity::Admin
# @authors Robbie Lieb <robbie@onthecity.org>, Wes Hays <wes@onthecity.org>
# ******************************************* 

TCA_ENV = 'development' 
THE_CITY_ADMIN_PATH = 'http://api.devthecity.org:9292' 
key = '66c59e2ee24553e7237259e30b4c17365681b95c'
token = 'a9ae4af3c3e80102'


require 'ruby-debug'
require File.dirname(__FILE__) + '/../lib/the_city_admin.rb'

require File.dirname(__FILE__) + '/city_keys.rb'
include CityKeys

TheCity::AdminApi.connect(KEY, TOKEN)


de_list = TheCity::DonationExportList.new
de_list.each do |item|
  puts "DonationExport: #{item.inspect}"
end

# de_list = TheCity::DonationExportList.new
# de_list.each do |item|
#   if item.delete 
#     puts "DonationExport #{item.id} deleted"
#   else
#     puts "Unable to delete donation export #{item.id}: #{item.error_messages.join(', ')}"
#   end
# end

# de_list = TheCity::DonationExportList.new
# if de_list.empty?
#   puts "No donation exports found"
# else
#   puts "Donation exports found"
# end

# donation_export = TheCity::DonationExport.new
# if donation_export.save
#   puts "Donation export created"
# else
#   puts "Failed to create donation export"
# end


# de_list = TheCity::DonationExportList.new
# if de_list.empty?
#   puts "No donation exports found"
# else
#   puts "Donation exports found"
# end

puts "------------------------------------"

puts "####################################"


