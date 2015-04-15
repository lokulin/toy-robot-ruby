require_relative 'robot'
require_relative 'table'

class RobotRunner
  @@dirs = ["east","north","west","south"]

  def placeargs args
    return args[0].to_i, args[1].to_i, @@dirs.index(args[2]).to_f*0.5, Table.new(0,0,4,4)
  end

  def run file
    robot = Robot.new
    valid_cmds = Robot.public_instance_methods - Object.methods

    IO.foreach file do |line|
      if /\A[A-Z]+( \d+,\d+,(NORTH|EAST|SOUTH|WEST)){0,1}\n\z/ === line
        cmd, *args = line.downcase.split(/[\s,","]/)
        *args = placeargs args if cmd == "place"
        robot = robot.send cmd,*args if valid_cmds.index(cmd.to_sym)
      end
    end
  end
end
