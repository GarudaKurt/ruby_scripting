#!/usr/bin/env ruby

person = { name: "Alice", age: 30, city: "Manila" }

person.each do |key, value|
  puts "#{key}: #{value}"
end
