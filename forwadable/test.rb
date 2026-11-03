#!/usr/bin/env ruby

require "forwardable"

class RecordCollection
    extend Forwardable
    
    def_delegator :@records, :[], :record_number

    def initializ
        @records = []
    end
end

rc = RecordCollection.new
rc.instance_variable_set(:@records, ["Alice", "Bob", "Carol"])

puts rc.record_number(1)
