#!/usr/bin/env ruby

words = %w[foo bar baz]

puts "Display using words.each"
enumerator = words.each { |var| puts var }

puts "Display using each with index"
enumerator.each_with_index { |word, i| puts "#{i}: #{word}"}

puts "External iteration"
enumerator = words.each
puts enumerator.next
puts enumerator.next
