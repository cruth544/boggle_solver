class Boggle_Char
  attr_accessor :char
  attr_accessor :used

  def initialize char
    self.char = char.downcase
    self.used = false
  end

  def to_s
    self.char
  end

end
