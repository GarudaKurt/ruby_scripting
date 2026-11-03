#!/usr/bin/env ruby

require_relative "user"

user = File.open("user.dump", "rb") do |file|
   Marshal.load(file)
end

puts user.name
puts user.age
puts user.skills
