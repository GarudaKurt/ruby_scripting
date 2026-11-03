#!/usr/bin/env ruby


Customer = Struct.new(:name, :address, :zip)

c1 = Customer.new("Alice", "123 Main St.", "1999")

#puts c1.name
#puts c1.address
#puts c1.zip
# Iterating
#c1.each { |val| puts val }

puts c1.to_h


Animal = Struct.new(:name, :breed, :age) do
  def info
    "#{name} I am #{breed} my age #{age}"
  end
end

a1 = Animal.new("Mel-mel", "Persian", 10)
puts a1.info
