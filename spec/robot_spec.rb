require_relative '../lib/robotrunner'

describe Robot do
  let(:robotrunner) { RobotRunner.new }
  before { ARGV.clear }

  describe 'Run' do
    it "Example 1 prints 0,1,NORTH" do
      expect(STDOUT).to receive(:puts).with('0,1,NORTH')
      ARGV[0] = "example/example1.txt"
      robotrunner.run
    end

    it "Example 2 prints 0,0,WEST" do
      expect(STDOUT).to receive(:puts).with('0,0,WEST')
      ARGV[0] = "example/example2.txt"
      robotrunner.run
    end

    it "Example 3 prints 3,3,NORTH" do
      expect(STDOUT).to receive(:puts).with('3,3,NORTH')
      ARGV[0] = "example/example3.txt"
      robotrunner.run
    end

    it "Example 4 prints nothing" do
      expect(STDOUT).to_not receive(:puts)
      ARGV[0] = "example/example4.txt"
      robotrunner.run
    end

    #it "Example 5 prints 3,4,NORTH" do
    #  expect(STDOUT).to receive(:puts).with('3,4,NORTH')
    #  ARGV[0] = "example/example5.txt"
    #  robotrunner.run
    #end
 end

end
