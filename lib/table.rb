class Table
  def initialize x,y,xx,yy
    @x, @y, @xx, @yy = x, y, xx, yy
    @objects = {}
  end

  def contains(x, y)
    return x, y if x >= @x && y >= @y && x <= @xx && y <= @yy && @objects[[x,y]].nil?
  end

  def store_object(location)
    @objects[location] = true
  end

  def map
    (@y..@yy).map{|y| (@x..@xx).map{|x| @objects[[x,y]] ? "X" : "0" }}
  end

end
