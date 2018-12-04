#!/usr/bin/env ruby

# day 1 part 2

a = File.read('input').split.map(&:to_i)

r = 0
h = Hash.new(0)

a.cycle do |i|
  r += i
  h[r] += 1
  if h[r] > 1
    puts r
    break
  end
end
