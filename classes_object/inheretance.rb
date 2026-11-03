#!/usr/bin/env ruby

class Animal
  
  def initialize(name)
    @name = name
  end
  
  def speak
    "#{@name} makes a sound"
  end
end


class Cat < Animal # Cat inherits from Animal
    def speak
      "#{@name} says Meow" # override the speak
    end
end

class Fish < Animal
end

class Dogs < Animal
    def initialize(name, bread)
      super(name) # call Animal's intialize with 'name'
      @bread = bread
    end

  def speak
     super + "(specifically, a bark)" # calls animal's speak, then add to it
  end
end

cat = Cat.new("Whiskers")
fish = Fish.new("Nemo")
dog = Dogs.new("Rex", "Labrador")

puts cat.speak
puts fish.speak
puts dog.speak



