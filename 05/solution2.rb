#!/usr/bin/env ruby

require_relative 'line'

text_lines = ARGF.readlines

lines = text_lines.select { |l| !l.strip.empty? }.map { |l| Line.new(l) }

points = lines.flat_map(&:points)

point_counts = {}
points.each do |p|
  if point_counts[p].nil?
    point_counts[p] = 1
  else
    point_counts[p] += 1
  end
end

point_counts.keep_if { |_, count| count > 1 }

puts "Result: #{point_counts.size}"
