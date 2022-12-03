#!/usr/bin/env ruby

lines = ARGF.readlines.map(&:strip)

badges = (0...lines.size/3).map { |i|
  a = lines[3*i].split("")
  b = lines[3*i+1].split("")
  c = lines[3*i+2].split("")

  (a & b) & c
}.flatten

vals = badges.map { |c|
  ascii_val = c.ord

  if ascii_val > 96
    ascii_val - 96
  else
    (ascii_val - 64) + 26
  end
}

puts "Result: #{vals.sum}"
