require "pry"
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

class Boggle_Find
  class << self
    attr_accessor :solution
    attr_accessor :board
    attr_accessor :english_words
    attr_accessor :possible_words
  end

  def self.find_word board_as_string
    self.board = Boggle_Board.convert(board_as_string)
    self.english_words = File.read("wordsEn.txt").gsub(/\r/, "")
    self.solution = []
    for i in 0..self.board.length - 1
      row = self.board[i]
      for j in 0..row.length - 1
        puts "\n\nfind_word: #{i},#{j}"
        char = row[j]
        regexp = Regexp.new("^#{char.char}\\w+$")
        self.set_possible_words(self.english_words, regexp)
        char.used = true
        self.next_char({row: i, col: j}, char.char)
        self.reset_used
      end
    end
    self.solution
  end

  private
  # go to next char and check if is a word
  def self.next_char origin, sub_str
    for i in -1..1
      for j in -1..1
        puts "next_char: #{sub_str}: #{i},#{j}"
        row = origin[:row] + i
        col = origin[:col] + j
        # Check if the next char is an actual index
        # next if i == 0 and j == 0
        next if row < 0 or row >= self.board.length
        next if col < 0 or col >= self.board.length
        # Check if character has already been used
        next if self.board[row][col].used

        # New sub_str to test
        new_sub_str = "#{sub_str}#{self.board[row][col].char}"
        # Immediately check to see if it is a full word
        if self.possible_words.match(Regexp.new("^#{new_sub_str}$"))
          unless self.solution.include?(new_sub_str)
            self.solution << new_sub_str
          end
        end

        # make regex to widdle down possible words
        regexp = Regexp.new("^#{new_sub_str}\\w+$")
        is_possible_word = self.set_possible_words(self.possible_words, regexp)
        # is_possible_word is equivalent to self.possible_words

        # Check if new_sub_str is an actual word
        # binding.pry
        if is_possible_word
          # Set boolean on char that has been used
          self.board[row][col].used = true
          # Continue to check if there is another possible word
          self.next_char({row: row, col: col}, new_sub_str)
        end
      end
    end

  end

  # helper methods
  def self.add_word word
    self.solution << word
  end

  def self.reset_used
    self.board.each do |row|
      row.each do |char|
        char.used = false
      end
    end
  end

  def self.set_possible_words wordbank, regexp
    # Shortens list of possible words
    # binding.pry
    reg_ex_list = wordbank.scan(regexp)
    if reg_ex_list.length > 0
      # If it is possible, reset possible words list
      self.possible_words = reg_ex_list.join("\n")
    else
      # If not, return false
      false
    end
  end

end

boggle = [
  ["A", "G", "H", "I"],
  ["K", "L", "P", "S"],
  ["Y", "E", "U", "T"],
  ["E", "O", "R", "N"],
]
puts Boggle_Find.find_word(boggle)
# board = Boggle_Board.convert(boggle)
# puts board
