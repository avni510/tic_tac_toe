module TicTacToe
  require "spec_helper"
  describe HardComputer do
    it "" do
      mock_console_ui = double

      hardcomputer = HardComputer.new("X", mock_console_ui)

      board = Board.new([
            "0", "1", "2",
            "3", "4", "5", 
            "6", "7", "8"
          ])

      hardcomputer.minmax(board)
    end

  end
end
