#!/usr/bin/env ruby

s = ""
i = ""
while (i = gets)
  s += i
end

a = s.split.map(&:to_i)

r = 0
h = Hash.new(0)

a.cycle do |i|
  r += i
  h[r] += 1
  if h[r] > 1
    puts r
    found = true
    break
  end
end
