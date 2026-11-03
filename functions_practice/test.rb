#!/usr/bin/env ruby


def greet
  puts "Hello World!"
end

greet

def check_number(number, string)
  if(number == 5)
    puts "Match found"
  end
  if string == "Test"
    puts "Match found"
  end
end

check_number(5, "Test")
