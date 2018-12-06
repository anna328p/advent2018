#!/usr/bin/env ruby

# Day 3 Part 1

file = File.readlines 'input'
`convert -size 1000x1000 xc:white output.png`

rect_cmds, label_cmds = '', ''

file.map { |s|
  /#(?<id>\d+) @ (?<x>\d+),(?<y>\d+): (?<width>\d+)x(?<height>\d+)/ =~ s
  { id: id.to_i, x: x.to_i, y: y.to_i, w: width.to_i, h: height.to_i }
}.each { |s|
  rect_cmds << "-draw \"rectangle #{s[:x]},#{s[:y]} #{s[:x] + s[:w]},#{s[:y] + s[:h]}\" "
  label_cmds << "-draw \" text #{s[:x]},#{s[:y]} '#{s[:id]}'\" "
  puts s
}

`convert output.png \
  -strokewidth 0 \
  -fill "rgba( 0, 0, 0, 0.1 )" \
  #{rect_cmds} \
  -fill "rgba( 0, 0, 0, 1 )" \
  #{label_cmds} \
  output.png`
