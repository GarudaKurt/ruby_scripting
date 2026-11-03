#!/usr/bin/env ruby

def memoize(&computation)
    cache = {}
    ->(arg) { cache[arg] ||= computation.call(arg) }
end

price_with_tax = memoize { |amounth| amounth * 1.20 }
puts price_with_tax.call(100) # => 120.0
puts price_with_tax.call(100) # cachec, no recompute

