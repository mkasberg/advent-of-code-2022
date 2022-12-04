#!/usr/bin/env ruby

lines = ARGF.readlines.map(&:strip)

count = 0
fully_contained = lines.map do |l|
  ranges = l.split(",").map { |r|
    numbers = r.split("-")

    {
      min: numbers.first.to_i,
      max: numbers.last.to_i
    }
  }

  (ranges.first[:min] <= ranges.last[:min] && ranges.first[:max] >= ranges.last[:max]) ||
    (ranges.last[:min] <= ranges.first[:min] && ranges.last[:max] >= ranges.first[:max])
end

r = fully_contained.select { |x| x }.count


puts "Result: #{r}"
