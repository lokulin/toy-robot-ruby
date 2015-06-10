include Math

class Robot
  attr_reader :table

  def initialize(x = 0, y = 0, facing = 0.0, table = nil, dirs = @dirs)
    @x, @y, @facing, @table, @dirs = x, y, facing, table, dirs
  end

  def move
    place(*infront(), @facing, @table)
  end

  def left
    place(@x, @y, (@facing-0.5)%2.0, @table)
  end

  def right
    place(@x, @y, (@facing+0.5)%2.0, @table)
  end

  def report
    puts "#{@x},#{@y},#{@dirs[(@facing*2.0).to_i]}" if @table.instance_of? Table
    self
  end

  def place(x, y, facing, table)
    if (table.instance_of?(Table) && table.contains(x, y))
      Robot.new(x, y, facing, table, @dirs)
    else
      self
    end
  end

  def place_object
    @table.store_object(infront()) if @table.instance_of?(Table)
    self
  end

  private
  def infront
    return (@x+sin(PI*@facing)).to_i, (@y+cos(PI*@facing)).to_i
  end
end

