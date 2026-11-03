#!/usr/bin/env ruby

require "json"

# data = '["foo", 1, 1.0, 2.0e2, true, false,null]'
json = '{"foo": {"bar": 1, "baz": 2}, "bat": [0,1,2]}'
puts JSON.parse(json)
