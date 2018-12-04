#!/usr/bin/env ruby

# Day 2 Part 1

#s = ""
#i = ""
#while (i = gets)
#  s += i
#end

s = File.read('input').split

puts s.combination(2).map { |a| a = a.map(&:chars); a[0].map.with_index{ |c, i| c == a[1][i] ? c : nil} }.select { |a| a.compact.size == 25 }.join
