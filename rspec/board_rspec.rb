require "./rspec/boggle_rspec"

describe Boggle_Board do
  before :each do
    boggle = [
      ["N", "N", "C", "C"],
      ["I", "H", "H", "A"],
      ["C", "O", "A", "T"],
      ["K", "J", "D", "S"],
    ]
    @board = Boggle_Board.convert(boggle)
  end

  describe "#convert" do
    it "takes one parameter and returns an Array" do
      expect(@board).to be_an_instance_of(Array)
    end
  end

  it 'returns an array of arrays' do
    @board.each do |arr|
      expect(arr).to be_an_instance_of(Array)
    end
  end

  it 'returns arrays of arrays that hold Boggle_Chars' do
    @board.each do |arr|
      arr.each do |boggle_char|
        expect(boggle_char).to be_an_instance_of(Boggle_Char)
      end
    end
  end
end
