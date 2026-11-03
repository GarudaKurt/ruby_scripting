#!/usr/bin/env ruby


class User 
    attr_accessor :name, :age

    def initialize(name,age)
      @name = name
      @age = age
    end
end

user = User.new("Itachi", 30)

data = Marshal.dump(user)

user2 = Marshal.load(data)

puts user.class
puts user2.class

puts user.name
puts user2.name

puts user.equal?(user2)

