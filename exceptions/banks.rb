#!/usr/bin/env ruby 


class InssufficientFundsError < StandardError
  def initialize(msg = "Not enough balance for this withdrawal")
    super (msg)
  end
end


class BankAccount
  def initialize(balance)
    @balance = balance
  end
  
  def withdraw(amount)
    raise InssufficientFundsError if amount > @balance
    @balance -= amount
  end
end

account = BankAccount.new(199)

begin
  puts account.withdraw(50)
rescue InssufficientFundsError => e
  puts "Transaction failed: #{e.message}"
end


print "Hello world"
