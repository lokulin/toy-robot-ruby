require_relative 'robot'

class RobotRunner

  def initialize file
    @file=file
    @valid_cmds = Robot.public_instance_methods - Object.methods
    @robot = Robot.new ->(location){
      location if location[0] >= 0 && location[0] <= 4 &&
              location[1] >= 0 && location[1] <= 4
    }
  end

  def run
    IO.foreach @file do |line|
      if /\A[A-Z]+( \d+,\d+,[A-Z]+){0,1}\n\z/ === line
        cmd, args = line.downcase.split(" ")
        args = args.split(",") if args
        @robot.send cmd,*args if @valid_cmds.index(cmd.to_sym)
      end
    end
  end

end
