require_relative "boggle_char"

class Boggle_Board
  def self.convert arr
    boggle_array = []
    arr.each do |row|
      boggle_row = []
      row.each do |char|
        boggle_row << Boggle_Char.new(char)
      end
      boggle_array << boggle_row
    end
    boggle_array
  end
end
