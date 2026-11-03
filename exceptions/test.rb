#!/usr/bin/env ruby


def div(x,y)
  begin
     z=x/(y*y)
       raise "Exceptions occurs y is < i0" if y == 0
     return z
  end
end


puts div(2,0)

