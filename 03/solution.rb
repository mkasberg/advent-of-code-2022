#!/usr/bin/env ruby

lines = ARGF.readlines

sums = []
lines.each do |l|
  l[0..-2].each_char.with_index do |c, i|
    sums[i] = 0 if sums[i].nil?
    sums[i] += 1 if c == "1"
  end
end

gamma = ""
sums.each do |s|
  if s > lines.length / 2
    gamma << "1"
  else
    gamma << "0"
  end
end

epsilon = ""
gamma.each_char do |c|
  if c == "1"
    epsilon << "0"
  else
    epsilon << "1"
  end
end

e_num = 0
epsilon.reverse.each_char.with_index do |c, i|
  e_num += 2**i if c == "1"
end

g_num = 0
gamma.reverse.each_char.with_index do |c, i|
  g_num += 2**i if c == "1"
end

puts "gamma: #{gamma} #{g_num}"
puts "epsilon: #{epsilon} #{e_num}"
puts "Result: #{e_num * g_num}"
