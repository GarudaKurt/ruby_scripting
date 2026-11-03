#!/usr/bin/env ruby

class BankAccount
  attr_reader :balance
  attr_writer :account_notes
  attr_accessor :name

  def initialize(balance, name)
    @balance = balance
    @account_notes = ""
    @name = name
  end

end


acc = BankAccount.new(500, "Mel-mel")
puts acc.balance
puts acc.name

acc.name = "Ben"
puts acc.name
acc.account_notes = "Flagged for review"
# acc.account_notes


