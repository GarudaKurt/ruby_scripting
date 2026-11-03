#!/usr/bin/env ruby


user = { 
   name: "Aldren",
   age: 30
}

data = Marshal.dump(user)
restored_user = Marshal.load(data)

puts restored_user
puts user.equal?(restored_user)

File.open("user.dump", "wb") do |file|
  Marshal.dump(user, file)
  puts user
end
# puts data.class
# puts data.bytesize

