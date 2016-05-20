require_relative 'robot'
require_relative 'table'

class RobotRunner
  def run
    dirs = %w{NORTH EAST SOUTH WEST}
    robot = Robot.new(0,0,0,nil,dirs)
    table = Table.new(0,0,4,4)

    ARGF.each do |line|
      if line =~ /(?<=^)([A-Z_]+$
                         |PLACE(?=\s?(\d+),(\d+),(#{dirs*"|"})$))/x
        case $1
        when "MOVE", "LEFT", "RIGHT", "REPORT", "PLACE_OBJECT"
          robot = robot.send($1.downcase)
        when "PLACE"
          robot = robot.send($1.downcase,$2.to_i,$3.to_i,dirs.index($4)/2.0,table)
        when "MAP"
          robot.table.map().reverse_each{ |r| r.each{ |c| print c }; puts}
          puts
        end
      end
    end
  end

  def stress
    robot.place(0,0,0.0,Table.new(0,0,4,4))
    (0..100_000_000).each do
      robot = robot.move
      robot = robot.left
      robot = robot.left
      robot = robot.move
      robot = robot.right
      robot = robot.right
    end
  end
end

