require_relative '../lib/robotrunner'
require 'matrix'

describe RobotRunner do
  let(:robotrunner) { RobotRunner.new nil }
  
  describe '#input_is_valid?' do
    context 'when blank line' do
      it "is invalid" do 
        expect(robotrunner.input_is_valid? "\n").to eq(false)
      end
    end

    context 'when too many words' do
      it "is invalid" do 
        expect(robotrunner.input_is_valid? "PLACE NORTH 1,2,NORTH\n").to eq(false)
      end
    end

    context 'when has leading white space' do
      it "is invalid" do 
        expect(robotrunner.input_is_valid? "  PLACE 1,2,NORTH\n").to eq(false)
      end
    end

    context 'when has trailing white space' do
      it "is invalid" do 
        expect(robotrunner.input_is_valid? "PLACE 1,2,NORTH  \n").to eq(false)
      end
    end

    context 'when has extra white space' do
      it "is invalid" do 
        expect(robotrunner.input_is_valid? "PLACE   1,2,NORTH\n").to eq(false)
      end
    end

    context 'when unknown direction' do
      it "is invalid" do 
        expect(robotrunner.input_is_valid? "PLACE 1,2,NORTHWEST\n").to eq(false)
      end
    end

    context 'when coordinates are not digits' do
      it "is invalid" do 
        expect(robotrunner.input_is_valid? "PLACE LEFT,BOTTOM,NORTH\n").to eq(false)
      end
    end

    context 'when commands are lowercase' do
      it "is invalid" do 
        expect(robotrunner.input_is_valid? "place 0,0,north\n").to eq(false)
      end
    end

    context 'when command has unexpected arguments' do
      it "is invalid" do
        expect(robotrunner.input_is_valid? "MOVE 0,0,NORTH\n").to eq(false)
      end
    end

    context 'when command is well formed' do
      it "is valid" do 
        expect(robotrunner.input_is_valid? "PLACE 0,0,NORTH\n").to eq(true)
      end
    end
  end

end
