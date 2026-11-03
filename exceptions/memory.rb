#!/usr/bin/env ruby

MAX_ITERATIONS = 50

begin
   data = []
   MAX_ITERATIONS.times do |i|
     data << "x" * 10_000_000
     puts "Allocated chunk #{i + 1} (~#{( i + 1) * 10}MB so far)"
   end
   
   rescue NoMemoryError => e
       puts "Caught NoMemoryError: #{e.message}"
   rescue StandError => e
      puts "Caught other error: #{e.class} - #{e.message}"
   ensure
      puts "Done - released reference to allow garbage collection"
      data = nil
end
