#!/usr/bin/env ruby

puts "===== Calculator ===="

print "Enter First number: "
num1 = gets.to_i
puts

print "Enter Second number: "
num2 = gets.to_i
puts

print "Enter operations (+, -, *, /):"
op = gets.chomp

puts
print "Answer: #{num1} #{op} #{num2} = "

case op
when '+'
  puts num1 + num2
when '-'
  puts num1 - num2
when '*'
  puts num1 * num2
when '/'
  puts num1 / num2
end

puts
