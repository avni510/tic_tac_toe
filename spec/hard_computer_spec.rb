module TicTacToe
  require "spec_helper"
  describe HardComputer do
    it "" do
      mock_console_ui = double

      allow(mock_console_ui).to receive(:move_messages)
      allow(mock_console_ui).to receive(:computer_move_message)


      hardcomputer = HardComputer.new("X", mock_console_ui)

      board = Board.new([
            "X", "1", "X",
            "3", "O", "O", 
            "X", "7", "O"
          ])

      hardcomputer.make_move(board)
    end
  end
end
