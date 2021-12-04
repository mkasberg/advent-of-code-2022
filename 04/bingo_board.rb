require 'set'

class BingoBoard
  def initialize(rows)
    @rows = rows
    @unmarked_rows = rows
    @unmarked_cols = []
    rows.each.with_index do |row|
      row.each.with_index do |num, i|
        @unmarked_cols[i] = [] if @unmarked_cols[i].nil?
        @unmarked_cols[i] << num
      end
    end

    pp @unmarked_rows
    pp @unmarked_cols

    @marks = []
  end

  # Return true if bingo
  def mark(num)
    @marks << num

    mark_number(num, @unmarked_rows) ||
      mark_number(num, @unmarked_cols)
  end

  # Return true if bingo
  def mark_number(n, unmarked)
    unmarked.map! do |row|
      row.select { |e| e != n }
    end

    unmarked.any? { |r| r.empty? }
  end

  def unmarked_numbers
    all_numbers = @rows.flatten
    all_numbers - @marks
  end
end