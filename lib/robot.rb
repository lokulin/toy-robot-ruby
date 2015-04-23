include Math

class Robot
  def initialize(x = 0.0, y = 0.0, facing = 0.0, table = nil, dirs = @dirs)
    @x, @y, @facing, @table, @dirs = x, y, facing, table, dirs
  end

  def move
    place @x+sin(PI*@facing), @y+cos(PI*@facing), @facing, @table
  end

  def left
    place @x, @y, (@facing-0.5)%2.0, @table
  end

  def right
    place @x, @y, (@facing+0.5)%2.0, @table
  end

  def report
    puts "#{@x.to_i},#{@y.to_i},#{@dirs[(@facing*2.0).to_i]}" if @table.instance_of? Table
    self
  end

  def place(x, y, facing, table)
    if (table.instance_of?(Table) && table.contains(x, y))
      Robot.new(x, y, facing, table, @dirs)
    else
      self
    end
  end
end

