#!/usr/bin/env ruby

positions = ARGF.readline.strip.split(',').map(&:to_i)

def sum_to(n)
  # Sum from i=1 to n is (n^2 + n) / 2
  ((n * n) + n) / 2
end

cost = {}
(positions.min..positions.max).each do |position|
  cost[position] = positions.map { |crab| sum_to((position - crab).abs) }.sum
end

min_cost = cost.values.min
align = cost.key(min_cost)

puts "Position: #{align}  Cost: #{min_cost}"
