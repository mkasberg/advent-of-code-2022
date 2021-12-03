#!/usr/bin/env ruby

lines = ARGF.readlines

horizontal = 0
depth = 0
lines.each do |l|
  case l[0]
  when "f"
    data = /forward (\d+)/.match(l)
    horizontal += data[1].to_i
  when "d"
    data = /down (\d+)/.match(l)
    depth += data[1].to_i
  when "u"
    data = /up (\d+)/.match(l)
    depth -= data[1].to_i
  end
end

puts "Horizontal: #{horizontal}"
puts "Depth: #{depth}"
puts "Product: #{horizontal * depth}"
