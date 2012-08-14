# *******************************************
# This is a demo file to show usage.
#
# @package TheCity::Admin
# @authors Robbie Lieb <robbie@onthecity.org>, Wes Hays <wes@onthecity.org>
# ******************************************* 

require 'ruby-debug'
require File.dirname(__FILE__) + '/../lib/the_city_admin.rb'

# sskilling
# key = 'bc6b57204b0ee4818bb4b3befd0f3292e93a2d0a'
# token = '7cfed59b037125d3' 

# Local
key = '66c59e2ee24553e7237259e30b4c17365681b95c'
token = 'a9ae4af3c3e80102'

TheCity::AdminApi.connect(key, token)


puts "------------------------------------"

skill_list = TheCity::SkillList.new
if skill_list.empty?
  puts "No skils in list"
else
  puts "Skills: #{skill_list.count}"
end

skill = TheCity::Skill.new
skill.name = 'ZProgrammer'
if skill.save
  puts "Skill created (#{skill.id})"
else
  puts "Failed to create skill: #{skill.error_messages.join(', ')}"
end


skill_list2 = TheCity::SkillList.new
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

skill_list3 = TheCity::SkillList.new
if skill_list3.empty?
  puts "No skills in list"
else
  puts "Skills: #{skill_list3.count}"
end

puts "####################################"
