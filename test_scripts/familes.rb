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


puts "------------------------------------"

user_list = TheCity::UserList.new
user1 = user_list[0]
user2 = user_list[1]

family = TheCity::Family.new 
family.external_id = 'family123'

member1 = TheCity::FamilyMember.new
member1.user_id = user1.id
member1.name = user1.full_name
member1.email = user1.email
member1.external_id_1 = 'weshays123'
member1.birthdate = user1.birthdate
member1.family_role = TheCity::FamilyMember::Roles[:spouse]
family.add_family_member(member1)

member2 = TheCity::FamilyMember.new
member2.user_id = user2.id
member2.name = user2.full_name
member2.email = user2.email
member2.external_id_1 = 'annahays123'
member2.birthdate = user1.birthdate
member2.family_role = TheCity::FamilyMember::Roles[:spouse]
family.add_family_member(member2)

if family.save
  puts "Family saved"
else
  puts "** Unable to save new family: #{family.error_messages.join(', ')}"
  puts family.to_attributes
end


#family2 = TheCity::Family.load_by_id(398768686)

# if family.nil?
#   puts "Family found with #{family.members.size} members"
# else
#   puts "Family: #{family.id}"
# end


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
