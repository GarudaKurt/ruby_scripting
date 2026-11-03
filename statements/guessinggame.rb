#!/usr/bin/env ruby

num = rand(20)
print 'Enter a guess: '
guess = gets.chomp.to_i

until guess == num do
    if guess < num
      puts "Too low"
    elsif guess > num
      puts "Too high"
    end
    print 'Enter a guess: '
    guess = gets.chomp.to_i
end

puts "Good job, the number was #{num}"
