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
key = 'cf2903151e3213e66fd8080c7d8b65b1d6ccdd31'
token = '5c88b32edda7653c'

TheCity::AdminApi.connect(key, token)


puts "------------------------------------"

term_list = TheCity::TerminologyList.new
if term_list.empty?
  puts "No terms in list"
else
  puts "Terms: #{term_list.count}"
end


term = TheCity::Terminology.load_by_term('CG')
if term.nil?
  puts "Terminology not found"
else
  puts "Terminology found by term: #{term.term}::#{term.label}"
end

term.label = 'Dog'
if term.save
  puts "Term updated (#{term.term})"
else
  puts "Failed to create term: #{term.error_messages.join(', ')}"
end

term2 = TheCity::Terminology.load_by_term('CG')
if term2.nil?
  puts "Terminology not found"
else
  puts "Terminology found by term: #{term2.term}::#{term2.label}"
end

term2.label = 'Community'
if term2.save
  puts "Term updated (#{term2.term})"
else
  puts "Failed to create term: #{term2.error_messages.join(', ')}"
end

term3 = TheCity::Terminology.load_by_term('CG')
if term3.nil?
  puts "Terminology not found"
else
  puts "Terminology found by term: #{term3.term}::#{term3.label}"
end

puts "####################################"
