#!/usr/bin/env ruby

lines = ARGF.readlines.map(&:strip)

dupes = lines.map { |l|
  a = l.split("")
  m = a.size/2
  front = a[0...m]
  back = a[m...a.size]
  front & back
}.flatten

pp dupes

vals = dupes.map { |c|
  ascii_val = c.ord

  if ascii_val > 96
    ascii_val - 96
  else
    (ascii_val - 64) + 26
  end
}

puts "Result: #{vals.sum}"
