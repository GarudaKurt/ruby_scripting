#!/usr/bin/env ruby

double = proc { |n| n * 2 }

puts double.call(21)
puts double.(21)
puts double[21]


puts [1, 2, 3].map(&double)
