#!/usr/bin/env ruby

require_relative 'lanternfish'

line = ARGF.readline

ages = line.strip.split(',').map(&:to_i)
fish_by_age = ages.group_by { |age| age }.transform_values(&:length)

(1..256).each do |day|
  new_by_age = {
    8 => fish_by_age[0] || 0,
    7 => fish_by_age[8] || 0,
    6 => (fish_by_age[0] || 0) + (fish_by_age[7] || 0)
  }
  (0..5).each do |age|
    new_by_age[age] = fish_by_age[age + 1]
    new_by_age[age] = 0 if new_by_age[age].nil?
  end
  fish_by_age = new_by_age
end

puts "Result: #{fish_by_age.values.sum}"
