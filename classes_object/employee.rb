#!/usr/bin/env ruby

class Employee
   attr_accessor :name, :salary
   attr_reader :id

   @@employee_count = 0

   def initialize(name, salary)
       @name = name
       @salary = salary
       @@employee_count += 1
       @id = @@employee_count 
   end
   
   def give_raise(amount)
     @salary += amount
    end

   def to_s
      "Employee ##{@id}: #{@name}, ##{@salary}"
   end

   def self.count
     @@employee_count
   end

end

class Manager < Employee
    def initialize(name, salary, team_size)
        super(name, salary)
        @team_size = team_size
    end
end


alice = Employee.new("Alice", 5000)
bob = Employee.new("Bob", 7000)

alice.give_raise(5000)

puts alice
puts bob

puts "Employee count: ", Employee.count

