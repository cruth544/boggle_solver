require "./boggle_rspec"

describe Boggle_Find do
  before :each do
    board = [
      ["H", "O", "R", "C"],
      ["U", "Y", "H", "T"],
      ["D", "A", "F", "A"],
      ["D", "E", "L", "N"],
    ]
    @boggle = Boggle_Find.find_word(board)
  end

  describe "#find_word" do
    it "takes one parameter and returns an Array" do
      expect(@boggle).to be_an_instance_of(Array)
    end
  end

  it 'returns an array of english words' do
    expect(@boggle).to include("day")
    expect(@boggle).to include("fat")
    expect(@boggle).to include("fan")
  end

  it 'returned array should not include words not found in boggle board' do
    expect(@boggle).not_to include("rude")
    expect(@boggle).not_to include("cat")
    expect(@boggle).not_to include("hoy")
  end
end
