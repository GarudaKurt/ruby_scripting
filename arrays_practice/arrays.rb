#!/usr/bin/env ruby

fruits = ["apple", "banana", "cherry"]

puts fruits[0]
puts fruits.length

fruits.push("date")
fruits.each do |fruit|
   puts fruit
end


fruits.each { |var| puts  var}

numbers = [1,2,3,4,5,6]
results = []

puts "Select filter"
numbers.select { |n| results << n if n.even? }

results

# swap two arrays
array1 = [1,2,3,4,5]
array2 = [6,7,8,9,10]

puts "Before Swap"
puts "Array 1"
array1.each { |num| puts num }

puts "Array 2"
array2.each { |num| puts num }

for i in  0...array1.length
    temp = array1[i]
    array1[i] = array2[i]
    array2[i] = temp
end

puts "After swap"

puts "Array 1"
array1.each { |num| puts num }

puts "Array 2"
array2.each { |num| puts num }
