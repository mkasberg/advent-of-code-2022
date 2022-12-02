#!/usr/bin/env ruby

lines = ARGF.readlines.map(&:strip)

total_calories = []
current_calories = 0

lines.each do |l|
    if l.empty?
        total_calories << current_calories
        current_calories = 0
    else
        current_calories += l.to_i
    end
end

if current_calories != 0
    total_calories << current_calories
end

puts "Result: " + total_calories.sort.last(3).sum.to_s
