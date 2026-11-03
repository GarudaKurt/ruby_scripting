#!/usr/bin/bash ruby

names = ["Alice", "Bob", "Carol"].each
ages = [30, 25, 35].each

loop do
  name = names.next
  ages = ages.next
  puts "#{name} is #{ages} years old"
end
