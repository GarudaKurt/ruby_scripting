#!/usr/bin/env ruby

# Yield
def with_transaction
  puts "BEGIN"
  yield
  puts "COMMIT"
end

with_transaction { puts "Update user..." }


def repeat(times, &block)
  times.times { |i| block.call(i) }
end

repeat(3) { |i| puts "attempt #{i}" }


# proc 

dobule = proc { |n| n * 2 }

puts double.call(21)
puts double.(21)
puts doubke[21]

