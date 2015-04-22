require_relative 'robot'
require_relative 'table'

class RobotRunner
  @@dirs = ["east","north","west","south"]

  def placeargs args
    return args[0].to_i, args[1].to_i, @@dirs.index(args[2].downcase).to_f*0.5, Table.new(0,0,4,4)
  end

  def run file
    robot = Robot.new
    valid_cmds = Robot.public_instance_methods - Object.methods

    IO.foreach file do |line|
      match = %r"(?<=^)(MOVE$|LEFT$|RIGHT$|REPORT$|PLACE(?=\s?(\d+),(\d+),(NORTH|EAST|SOUTH|WEST)$))".match(line)
      cmd, *args = match.captures unless match.nil?
      case cmd
      when "MOVE", "LEFT", "RIGHT", "REPORT"
        robot = robot.send cmd.downcase
      when "PLACE"
        *args = placeargs args
        robot = robot.send cmd.downcase,*args
      end
    end
  end
end

