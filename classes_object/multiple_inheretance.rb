#!/usr/bin/env ruby

module Swimmable
  def swim
    "#{@name} is swimming!"
  end
end

module Flyable
  def fly
    "#{@name} is flying!"
  end
end

class Duck
    include Swimmable #mixin
    include Flyable #mixin

    def initialize(name)
      @name = name
    end
end

donald = Duck.new("Donald")
puts donald.swim
puts donald.fly
