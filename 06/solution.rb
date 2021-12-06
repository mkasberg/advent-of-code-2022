#!/usr/bin/env ruby

require_relative 'lanternfish'

line = ARGF.readline

fish = line.strip.split(',').map(&:to_i).map { |age| Lanternfish.new(age) }

(1..80).each do |day|
  new_fish = fish.map(&:age).compact
  fish += new_fish
end

puts "Result: #{fish.length}"
