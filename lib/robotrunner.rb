require_relative 'robot'
require 'matrix'

class RobotRunner

  def initialize file
    @robot=nil
    @file=file
    @table = lambda do |location|
      location if location[0] >= 0 && location[0] <= 4 &&
              location[1] >= 0 && location[1] <= 4
    end
  end

  def input_is_valid? line
    /(\A[A-Z]+\n\z)|(\APLACE \d+,\d+,(NORTH|EAST|SOUTH|WEST)\n\z)/ === line
  end

  def send_cmd cmd,args
    if cmd == "place"
      x,y,direction = args.split(",")
      location=Vector[x.to_i,y.to_i]
      @robot=Robot.new location,direction,@table if @table[location]
    else
      @robot.send cmd if @robot.respond_to? cmd
    end
  end

  def run
    IO.foreach @file do |line|
      if input_is_valid? line
        cmd, args= line.downcase.split(" ")
        send_cmd cmd,args
      end
    end
  end

end
