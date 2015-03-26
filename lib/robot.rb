require 'matrix'

class Robot
  def initialize table
    @direction={
       :north => Vector[ 0,  1],
       :east  => Vector[ 1,  0],
       :south => Vector[-1,  0],
       :west  => Vector[ 0, -1]
    }
    @table = table
  end

  def place x, y, direction
    @location = @table[Vector[x.to_i, y.to_i]] || nil
    @direction = @direction.to_a.rotate(
        @direction.keys.index(direction.to_sym)
      ).to_h if @location && @direction.keys.index(direction.to_sym)
  end

  def move
    @location = @table[@location+@direction.values.first] || @location if @location
  end

  def left
    @direction = @direction.to_a.rotate(-1).to_h if @location
  end

  def right
    @direction = @direction.to_a.rotate.to_h if @location
  end

  def report
    puts "#{@location.to_a.join(",")},#{@direction.keys.first.upcase}" if @location
  end
end
