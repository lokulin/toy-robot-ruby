require_relative 'robot'
require_relative 'table'

class RobotRunner
  def placeargs args
    return args[0].to_f, args[1].to_f, @dirs.index(args[2]).to_f*0.5, Table.new(0,0,4,4)
  end

  def run
    @dirs = %w{NORTH EAST SOUTH WEST}
    robot = Robot.new(0,0,0,nil,@dirs)

    ARGF.each do |line|
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

