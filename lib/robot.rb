require 'matrix'

class Robot
  DIRECTIONS={
    "north" => Matrix[[ 0,  1],[-1,  0]],
    "east"  => Matrix[[ 1,  0],[ 0, -1]],
    "south" => Matrix[[ 0, -1],[ 1,  0]],
    "west"  => Matrix[[-1,  0],[ 0,  1]]
  }

  def initialize location, direction, bound
    @location=location
    @direction=DIRECTIONS[direction]
    @bound=bound
  end

  def move
    @location = @bound.call(@location+@direction.row(0)) || @location
  end

  def left
    @direction=Matrix.rows(@direction.to_a.reverse).transpose
  end

  def right
    @direction=Matrix.rows(@direction.transpose.to_a.reverse)
  end

  def report
    puts "#{@location.to_a.join(",")},#{DIRECTIONS.key(@direction).upcase}"
  end
end
