#!/usr/bin/env ruby

class BankAccount
   def initialize(balance)
     @balance = balance
    end

   # public by default
   def deposit(amount)
     @balance += amount
     log_transaction("deposit", amount)
   end

   def balance
     @balance
    end

   private 

   def log_transaction(type, amount)
       puts "LOG: #{type} of #{amount}"
   end
end

account = BankAccount.new(50)
account.deposit(100)

puts account.balance


