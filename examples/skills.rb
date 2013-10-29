# *******************************************
# This is a demo file to show usage.
#
# @package TheCityAdmin::Admin
# @authors Robbie Lieb <robbie@onthecity.org>, Wes Hays <wes@onthecity.org>
# ******************************************* 

require 'ruby-debug'
require File.dirname(__FILE__) + '/../lib/the_city_admin.rb'

require File.dirname(__FILE__) + '/city_keys.rb'
include CityKeys

TheCityAdmin::AdminApi.connect(KEY, TOKEN)


puts "------------------------------------"

skill_list = TheCityAdmin::SkillList.new
if skill_list.empty?
  puts "No skils in list"
else
  puts "Skills: #{skill_list.count}"
end

skill = TheCityAdmin::Skill.new
skill.name = 'ZProgrammer'
if skill.save
  puts "Skill created (#{skill.id})"
else
  puts "Failed to create skill: #{skill.error_messages.join(', ')}"
end


skill_list2 = TheCityAdmin::SkillList.new
if skill_list2.empty?
  puts "No skills in list"
else
  puts "Skills: #{skill_list2.count}"
end

if skill.delete 
  puts "Skill #{skill.id} deleted"
else
  puts "Unable to delete skill #{skill.id}: #{skill.error_messages.join(', ')}"
end

skill_list3 = TheCityAdmin::SkillList.new
if skill_list3.empty?
  puts "No skills in list"
else
  puts "Skills: #{skill_list3.count}"
end

puts "####################################"
