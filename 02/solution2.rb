#!/usr/bin/env ruby

lines = ARGF.readlines.map(&:strip)

score = 0
lines.each do |l|
    if l.include?("A")
        if l.include?("X")
            # Opponent Rock, me scissors
            score += 3
            score += 0
        elsif l.include?("Y") 
            # Opponent Rock, me rock
            score += 1
            score += 3
        else
            # Me paper
            score += 2
            score += 6
        end
    elsif l.include?("B")
        # Opponent Paper
        if l.include?("X")
            # Lose - me rock
            score += 1
            score += 0
        elsif l.include?("Y") 
            # draw - me paper
            score += 2
            score += 3
        else
            # Win - me scissors
            score += 3
            score += 6
        end
    elsif l.include?("C")
        #Opponent scissors
        if l.include?("X")
            # Lose - me paper
            score += 2
            score += 0
        elsif l.include?("Y") 
            # draw = me scissors
            score += 3
            score += 3
        else
            # Win - me rock
            score += 1
            score += 6
        end
    end
end

puts "Result: #{score}"
