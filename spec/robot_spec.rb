require_relative '../lib/robot'
require_relative '../lib/table'
require 'matrix'

describe Robot do
  let(:robot) { Robot.new(Table.new(0,0,4,4)) }

  describe '#place' do
    context 'on the table' do
      it "is placed" do
        expect(robot.place(0,0,'east')[0]).to eq(0)
        expect(robot.place(0,0,'east')[1]).to eq(0)
        expect(robot.place(0,0,'east')[2].first.name).to eq('east')
      end
    end
    
    context 'outside the table' do
      it "is not placed" do
        expect(robot.place(-1,0,'east')[0]).to eq(nil)
        expect(robot.place(0,-1,'east')[0]).to eq(nil)
        expect(robot.place(5,0,'east')[0]).to eq(nil)
        expect(robot.place(0,5,'east')[0]).to eq(nil)
      end
    end

    context 'using an invalid direction' do
      it "is not placed" do
        expect(robot.place(0,0,'up')[2]).to eq(nil)
      end
    end
  end
  
  describe '#move' do
    context 'a valid table location' do
      before { robot.place(0,0,'north') }
      it "moves" do 
        expect(robot.move).to eq([0,1])
      end
    end

    context 'outside the table' do
      before { robot.place(0,0,'south') }
      it "doesn't move" do 
        expect(robot.move).to eq([0,0])
      end
    end
  end

  describe '#left' do
    context 'facing north' do
      before { robot.place(0,0,'north') }
      it "turns west" do
        expect(robot.left.first.name).to eq('west')
      end
    end

    context 'facing west' do
      before { robot.place(0,0,'west') }
      it "turns south" do
        expect(robot.left.first.name).to eq('south')
      end
    end

    context 'facing south' do
      before { robot.place(0,0,'south') }
      it "turns east" do
        expect(robot.left.first.name).to eq('east')
      end
    end

    context 'facing east' do
      before { robot.place(0,0,'east') }
      it "turns north" do
        expect(robot.left.first.name).to eq('north')
      end
    end
  end

  describe '#right' do
    context 'facing north' do
      before { robot.place(0,0,'north') }
      it "turns east" do
        expect(robot.right.first.name).to eq('east')
      end
    end

    context 'facing west' do
      before { robot.place(0,0,'west') }
      it "turns north" do
        expect(robot.right.first.name).to eq('north')
      end
    end

    context 'facing south' do
      before { robot.place(0,0,'south') }
      it "turns west" do
        expect(robot.right.first.name).to eq('west')
      end
    end

    context 'facing east' do
      before { robot.place(0,0,'east') }
      it "turns south" do
        expect(robot.right.first.name).to eq('south')
      end
    end
  end

  describe '#report' do
    before { robot.place(0,0,'north') }
    it "prints the location and direction" do
      expect(STDOUT).to receive(:puts).with('0,0,NORTH')
      robot.report
    end
  end

end
