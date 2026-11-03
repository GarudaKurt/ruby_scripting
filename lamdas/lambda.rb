#!/usr/bin/env ruby

my_lambda = ->(a,b) { a + b }

my_lambda.call(10, 20)


my_proc = proc { |a, b| a + b }
my_proc.call(10)
