#!/usr/bin/env ruby
puts "This test for merge conflict"
class User
    attr_accessor :name, :age, :skills
    
    def initialize(name, age)
        @name = name
        @age = age
        @skills = []
    end

    def add_skill(skill)
        @skills << skill
    end
end
