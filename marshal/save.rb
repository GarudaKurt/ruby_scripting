#!/usr/bin/env ruby

require_relative "user"

user = User.new("Kurt", 30)

user.add_skill("Ruby")
user.add_skill("Linux")
user.add_skill("Git")

File.open("user.dump", "wb") do |file|
  Marshal.dump(user, file)
end

puts "User saved."

