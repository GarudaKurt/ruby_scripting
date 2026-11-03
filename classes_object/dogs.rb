#!/usr/bin/env ruby

class Dog
    def initialize(name, breed)
      @name = name
      @breed = breed
    end

    def name
      @name
    end

    def name=(new_name)
      @name = new_name
    end
end

rex = Dog.new("Rex", "Labrador")
puts rex.name

rex.name = "Max"
puts rex.name


class Cat
    attr_accessor :name
    attr_reader :bread

    def initialize(name, bread)
      @name = name
      @bread = bread
    end
end


cats = Cat.new("Mel", "Persian")
puts cats.name

cats.name = "Toragsoy"
puts cats.name


class Cow 
   @@total_dogs = 0 # class variable shared across all instances

   def initialize(name)
     @name = name
     @@total_dogs += 1
    end
   # instance method
   def introduce
     "I am #{@name}"
    end
   # class method, called on the class itself, uses 'self'
   def self.total_dogs
     @@total_dogs
   end
end

d1 = Cow.new("Rex")
d2 = Cow.new("Bella")

puts d1.introduce
puts Cow.total_dogs
