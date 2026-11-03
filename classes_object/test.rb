#!/usr/bin/env ruby

class Dog
    def initialize(name, breed)
        @name = name
        @breed = breed
    end

    def bark
        "#{@name} says Woof!"
    end
end

rex = Dog.new("Rex", "Labrador")

puts rex.bark
