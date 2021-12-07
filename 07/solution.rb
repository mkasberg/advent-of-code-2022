#!/usr/bin/env ruby

positions = ARGF.readline.strip.split(',').map(&:to_i)

cost = {}
(positions.min..positions.max).each do |position|
  cost[position] = positions.map { |crab| (position - crab).abs }.sum
end

min_cost = cost.values.min
align = cost.key(min_cost)

puts "Position: #{align}  Cost: #{min_cost}"
