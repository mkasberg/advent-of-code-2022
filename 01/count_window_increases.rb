#!/usr/bin/env ruby

lines = ARGF.readlines

increases_count = 0
(0...(lines.count-3)).each do |i|
    window1 = lines[i].to_i + lines[i+1].to_i + lines[i+2].to_i
    window2 = lines[i+1].to_i + lines[i+2].to_i + lines[i+3].to_i
    increases_count += 1 if window1 < window2
end

puts "There are #{increases_count} sliding window sums larger than the previous sum."
