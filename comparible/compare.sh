#!/usr/bin/env ruby


class StringSorter
    include Comparable

    attr :str

    def <=>(other)
        str.size <=> other.str.size
    end

    def initialize(str)
         @str = str
    end

    def inspect
        @str
    end
end


s1 = StringSorter.new("Z")
s2 = StringSorter.new("YY")
s3 = StringSorter.new("XXX")
s4 = StringSorter.new("WWWW")
s5 = StringSorter.new("VVVVVV")

puts s1 < s2
puts s4.between?(s1, s3)
puts s4.between?(s3, s5)
res = [ s3, s2, s5, s4, s1 ].sort
puts res

