#!/usr/bin/env ruby


puts GC.count
puts GC.start
puts GC.count
puts "====================="

def make_garbage
  1000.times { "x" * 100_000}
end

puts "Before: #{ GC.stat[:heap_live_slots] }"

make_garbage

puts "After creating garbage: #{GC.stat[:heap_live_slots]}"

GC.start

puts "After GC.start: #{GC.stat[:heap_live_slots]}"
