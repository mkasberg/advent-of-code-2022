class Line
  def initialize(text)
    points = text.split(' -> ')
    @start = points[0].strip.split(',').map(&:to_i)
    @finish = points[1].strip.split(',').map(&:to_i)
  end

  def is_vertical
    @start[0] == @finish[0]
  end

  def is_horizontal
    @start[1] == @finish[1]
  end

  def points
    if is_vertical
      min = [@start[1], @finish[1]].min
      max = [@start[1], @finish[1]].max
      (min..max).map do |y|
        [@start[0], y]
      end
    elsif is_horizontal
      min = [@start[0], @finish[0]].min
      max = [@start[0], @finish[0]].max
      (min..max).map do |x|
        [x, @start[1]]
      end
    else
      # Diagnoal
      min_x = [@start[0], @finish[0]].min
      max_x = [@start[0], @finish[0]].max
      min_y = [@start[1], @finish[1]].min
      max_y = [@start[1], @finish[1]].max

      x_range = min_x..max_x
      y_range = 
        if (@start[0] < @finish[0] && @start[1] < @finish[1]) || @start[0] > @finish[0] && @start[1] > @finish[1]
          min_y..max_y
        else
          (min_y..max_y).to_a.reverse
        end

      (x_range).zip(y_range).each do |x, y|
        [x, y]
      end
    end
  end
end
