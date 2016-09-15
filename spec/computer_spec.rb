require 'pry'
module TicTacToe
  require "spec_helper"
  
  describe Computer do
    let(:mock_console_ui) { double }

    before(:each) do
      allow(mock_console_ui).to receive(:move_messages)
      allow(mock_console_ui).to receive(:computer_move_message)
      computer_move_strategy = SimpleComputer.new({})
      args = 
        {
          player_marker: 'X',
          console_ui: mock_console_ui,
          ai: computer_move_strategy
        }
      @computer = Computer.new(args)
    end

    it "returns the player's marker" do
      expect(@computer.player_marker).to eq('X')
    end

#    it "" do
#      hard_comp_params = 
#        { opponent_marker: 'O',
#          game_eval: GameEval.new}
#
#      computer_move_strategy = HardComputer.new(hard_comp_params)
#      
#      computer_params = 
#        { 
#          console_ui: double, 
#          player_marker: 'X',
#          ai: computer_move_strategy,
#          opponent_marker: computer_move_strategy.opponent_marker,
#          game_eval: computer_move_strategy.game_eval
#      }
#
#      initial_board = Board.new(
#        [ 
#          "X", "O", "X",
#          "3", "O", "X", 
#          "6", "7", "8",
#        ])
#
#      computer = Computer.new(computer_params)
#      binding.pry
#      computer.make_move(board)
#    end

    describe ".make_move" do
      context "the computer selects a move that is not open" do
        it "selects another move" do
          initial_board = Board.new(
            [ 
              "X", "O", "X",
              "3", "O", "X", 
              "6", "7", "8",
            ])

          allow(Random).to receive(:rand).and_return(0, 6)

          board_after_computer_move = Board.new(
            [ 
              "X", "O", "X",
              "3", "O", "X", 
              "X", "7", "8",
            ])

          result_board = @computer.make_move(initial_board)

          result_array = result_board.cells
          
          board_after_computer_move_array = board_after_computer_move.cells

          expect(result_array).to eq(board_after_computer_move_array)
        end
      end
    end
  end
end
