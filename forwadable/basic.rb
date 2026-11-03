#!/usr/bin/env ruby

require 'forwardable'

class RecordCollection
   extend Forwardable

   def_delegators :@records, :size, :<<, :map
   def_delegator :@records, :[], :record_number

   def initialize
     @records = []
   end
end

r = RecordCollection.new
r.record_number(0) rescue nil

r << 1
r << 2
r << 3

puts r.record_number(0)
puts r.size
puts (r << 4)
puts r.map { |x| x * 2}.inspect
