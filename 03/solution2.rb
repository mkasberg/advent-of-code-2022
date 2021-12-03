#!/usr/bin/env ruby

lines = ARGF.readlines

def most_common_bit(lines, position)
  sum = 0
  lines.each do |l|
    sum += 1 if l[position] == "1"
  end
  if (2 * sum) >= lines.length
    "1"
  else
    "0"
  end
end

def least_common_bit(lines, position)
  opposite = most_common_bit(lines, position)
  if opposite == "1"
    "0"
  else
    "1"
  end
end

def binary_to_dec(n)
  dec = 0
  n.strip.reverse.each_char.with_index do |c, i|
    dec += 2**i if c == "1"
  end
  dec
end

bit_count = lines[0].strip.length
oxygen_lines = lines
co2_lines = lines
(0...bit_count).each do |i|
  most_common = most_common_bit(oxygen_lines, i)
  least_common = least_common_bit(co2_lines, i)

  if oxygen_lines.length > 1
    oxygen_lines = oxygen_lines.select { |l| l[i] == most_common }
  end
  if co2_lines.length > 1
    co2_lines = co2_lines.select { |l| l[i] == least_common }
  end
end

oxygen = binary_to_dec(oxygen_lines[0])
co2 = binary_to_dec(co2_lines[0])

puts "oxygen: #{oxygen_lines[0].strip} #{oxygen}"
puts "co2: #{co2_lines[0].strip} #{co2}"
puts "Result: #{oxygen * co2}"
