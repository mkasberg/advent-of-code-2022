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
numbers.each do |n|
  puts "marking #{n}"
  boards.each do |b|
    if b.mark(n)
      solution = n * b.unmarked_numbers.sum if solution.nil?
    end
  end
end

puts "Result: #{solution}"
