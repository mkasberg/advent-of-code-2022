#!/usr/bin/env ruby

lines = ARGF.readlines.map(&:strip)

score = 0
lines.each do |l|
    if l.include?("A")
        if l.include?("X")
            score += 1
            score += 3
        elsif l.include?("Y") 
            score += 2
            score += 6
        else
            score += 3
            score += 0
        end
    elsif l.include?("B")
        if l.include?("X")
            score += 1
            score += 0
        elsif l.include?("Y") 
            score += 2
            score += 3
        else
            score += 3
            score += 6
        end
    elsif l.include?("C")
        if l.include?("X")
            score += 1
            score += 6
        elsif l.include?("Y") 
            score += 2
            score += 0
        else
            score += 3
            score += 3
        end
    end
end

puts "Result: #{score}"
