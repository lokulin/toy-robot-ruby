require_relative '../lib/robot'
require 'matrix'

describe Robot do
  bounded = lambda { |a| false } 
  unbounded = lambda { |a| a }
  
  describe '#move' do
    context 'when unbounded' do
      let(:robot) { Robot.new Vector[0,0],"north",unbounded }
      it "moves" do 
        expect(robot.move).to eq(Vector[0,1])
      end
    end

    context 'when bounded' do
    let(:robot) { Robot.new Vector[0,0],"north",bounded}
      it "doesn't move" do 
        expect(robot.move).to eq(Vector[0,0])
      end
    end
  end

  describe '#left' do
    context 'when facing north' do
      let(:robot) { Robot.new Vector[0,0],"north",unbounded }
      it "turns to west" do
        expect(robot.left).to match(Matrix[[-1,0],[0,1]])
      end
    end

    context 'when facing west' do
      let(:robot) { Robot.new Vector[0,0],"west",unbounded }
      it "turns to south" do
        expect(robot.left).to match(Matrix[[0,-1],[1,0]])
      end
    end

    context 'when facing south' do
      let(:robot) { Robot.new Vector[0,0],"south",unbounded }
      it "turns to east" do
        expect(robot.left).to match(Matrix[[1,0],[0,-1]])
      end
    end

    context 'when facing east' do
      let(:robot) { Robot.new Vector[0,0],"east",unbounded }
      it "turns to north" do
        expect(robot.left).to match(Matrix[[0,1],[-1,0]])
      end
    end
  end

  describe '#right' do
    context 'when facing north' do
      let(:robot) { Robot.new Vector[0,0],"north",unbounded }
      it "turns to east" do
        expect(robot.right).to match(Matrix[[1,0],[0,-1]])
      end
    end

    context 'when facing west' do
      let(:robot) { Robot.new Vector[0,0],"west",unbounded }
      it "turns to north" do
        expect(robot.right).to match(Matrix[[0,1],[-1,0]])
      end
    end

    context 'when facing south' do
      let(:robot) { Robot.new Vector[0,0],"south",unbounded }
      it "turns to west" do
        expect(robot.right).to match(Matrix[[-1,0],[0,1]])
      end
    end

    context 'when facing east' do
      let(:robot) { Robot.new Vector[0,0],"east",unbounded }
      it "turns to south" do
        expect(robot.right).to match(Matrix[[0,-1],[1,0]])
      end
    end
  end

  describe '#report' do
    let(:robot) { Robot.new Vector[0,0],"east",unbounded }
    it "prints the location and direction" do
      expect(STDOUT).to receive(:puts).with('0,0,EAST')
      robot.report
    end
  end

end
