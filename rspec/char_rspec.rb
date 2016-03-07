require "../rspec/boggle_rspec"

describe Boggle_Char do
  before :each do
    @char = Boggle_Char.new("c")
  end

  describe "#new" do
    it "takes one parameter and returns a Boggle_Char object" do
      expect(@char).to be_an_instance_of(Boggle_Char)
    end
  end

  it 'has a 2 custom properties' do
    expect(@char.char).to eq 'c'
    expect(@char.used).to eq false
    @char.char = 'b'
    @char.used = true
    expect(@char.char).to eq 'b'
    expect(@char.used).to eq true
  end
end
