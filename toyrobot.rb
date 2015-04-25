require_relative 'lib/robotrunner'

abort("usage: ruby toyrobot.rb [input.txt] | [< input.txt]\n") unless ARGV.length <= 1

begin
  robotrunner=RobotRunner.new
  robotrunner.run
rescue IOError,Errno::ENOENT
  abort("File does not exist.")
end
