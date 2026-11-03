#!/usr/bin/env ruby


class Cat
    attr_accessor :name, :breed

    def initialize(name, breed)
      @name = name
      @breed = breed
    end

end

cats = Cat.new("Rex", "Persians")
puts cats.name
cats.name = "Mel-mel"
puts cats.name
