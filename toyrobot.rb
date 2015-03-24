require_relative 'lib/robotrunner'

abort("usage: ruby toyrobot.rb <input.txt>\n") unless ARGV.length == 1

robotrunner=RobotRunner.new ARGV[0]
robotrunner.run
