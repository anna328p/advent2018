#!/usr/bin/env ruby

# Day 3 Part 1

# Add increment method to class
class Array
  def inc
    self.map { |val| val + 1 }
  end
end

s = File.readlines 'input'

a = Array.new(2000) { Array.new(2000) { 0 } }

s.map { |str|
  /#(?<id>\d+) @ (?<x>\d+),(?<y>\d+): (?<width>\d+)x(?<height>\d+)/ =~ str
  { id: id.to_i, x: x.to_i, y: y.to_i, w: width.to_i, h: height.to_i }
}.each_with_index { |str, idx|
  a[str[:y]...str[:y] + str[:h]].each do |row|
    range = ((str[:x])...(str[:x] + str[:w]))
    row[range] = row[range].inc
  end
}

puts a.flatten.select { |i| i > 1 }.size
