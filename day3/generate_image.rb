#!/usr/bin/env ruby

# Day 3 Part 1

class Array
  def inc
    self.map &:inc
  end
end

class Integer
  def inc
    self + 1
  end
end

s = File.read('input').split(?\n)
`convert -size 1000x1000 xc:white output.png`

cmdstring = ""

a = Array.new(1000) { Array.new(1000, 0) }
s.map { |s|
  /#(?<id>\d+) @ (?<x>\d+),(?<y>\d+): (?<width>\d+)x(?<height>\d+)/ =~ s
  {id: id.to_i, x: x.to_i, y: y.to_i, w: width.to_i, h: height.to_i}
}.each { |s|
  cmdstring << "-draw \"rectangle #{s[:x]},#{s[:y]} #{s[:x]+s[:w]},#{s[:y]+s[:h]}\" "
  puts s
}

`convert output.png -strokewidth 0 -fill "rgba( 0, 0, 0, 0.1 )" #{cmdstring} output.png`
