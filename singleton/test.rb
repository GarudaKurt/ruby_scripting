#!/usr/bin/env ruby

str="hello"
puts "Hello Test World"

def str.shout
  self.upcase + "!"
end

puts str.shout

other_str = "world"
other_str.shout
