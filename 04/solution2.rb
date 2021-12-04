#!/usr/bin/env ruby

require_relative 'bingo_board'

lines = ARGF.readlines

numbers = lines.shift.split(',').map(&:to_i)

boards = []
while !lines.empty? do
  board = []
  line = ''
  while line.strip == '' && !lines.empty? do
    line = lines.shift
  end

  if !lines.empty?
    board << line.split(' ').map(&:to_i)
    (0..3).each do
      board << lines.shift.split(' ').map(&:to_i)
    end

    boards << BingoBoard.new(board)
  end
end

solution = nil
not_won_boards = (0...boards.length).to_a
numbers.each do |n|
  puts "marking #{n}"
  boards.each.with_index do |b, i|
    if b.mark(n)
      not_won_boards.keep_if { |index| index != i }
      if not_won_boards.length == 0 && solution.nil?
        solution = n * b.unmarked_numbers.sum
      end
    end
  end
end

puts "Result: #{solution}"
