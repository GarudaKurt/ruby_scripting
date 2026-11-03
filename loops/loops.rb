#!/use/bin/env ruby


number = 0
puts "While loops"
while number < 10
  puts number
  number = number + 1
end

puts

puts "Until "
until number > 10
  puts number
  number = number + 1
end

puts

puts "For loop"
for i in 0..10
  puts i
end

puts

puts "10 times"
10.times { |i| puts i }
