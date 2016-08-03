
module TicTacToe
  require "game_loop"

  describe GameLoop do 
    let(:mock_board) { double () }
    let(:mock_interface) { double () }
    let(:mock_eval_game) { double () }
    let(:mock_validation) { double () }
    let(:game_loop) {GameLoop.new(mock_board, mock_interface, mock_eval_game, mock_validation)}
    
    describe ".instructions" do 

      context "the user does not enter a valid move the first time" do 
        it "runs through a game of tic tac toe" do 
          board0 = ["X", "1", "X", "3", "4", "5", "O", "O", "8"]
          board1 = ["X", "X", "X", "3", "4", "5", "O", "O", "8"] 
          board_message = expect(mock_board).to receive(:nine_space_array).and_return(board0)

          board_message
          expect(mock_eval_game).to receive(:game_over?).with(board0, board1).and_return(false, true)
          
          board_message
          expect(mock_interface).to receive(:move_messages).with(board0).and_return("0")

          board_message
          
          expect(mock_validation).to receive(:board_conditions?).with(board0, any_args).and_return(false, true)

          expect(mock_interface).to receive(:valid_move_message).exactly(1).times
          board_message
          expect(mock_interface).to receive(:move_messages).with(board0).and_return("1")

          expect(mock_interface).to receive(:player1_symbol).and_return("X")
          expect(mock_board).to receive(:fill).with("1", "X").and_return(board1)
          

          expect(game_loop.instructions(nil)).to eq(1)
          
        end
      end
    end
  end
end
