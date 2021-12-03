#!/usr/bin/env ruby

lines = ARGF.readlines

increases_count = 0
(0...(lines.count-1)).each do |i|
    increases_count += 1 if lines[i].to_i < lines[i+1].to_i
end

puts "There are #{increases_count} measurements larger than the previous measurement."
