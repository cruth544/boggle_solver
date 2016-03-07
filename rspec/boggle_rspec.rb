require_relative '../boggle_solver/boggle_char'
require_relative '../boggle_solver/boggle_board'
require_relative '../boggle_solver/boggle_find'

RSpec.configure do |config|
  config.color = true
  config.order = :random
  config.tty = true

  config.formatter = :documentation
end
