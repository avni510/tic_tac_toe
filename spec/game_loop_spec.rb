module TicTacToe
  require "game_loop"

  describe GameLoop do 
    let(:mock_board) { double () }
    let(:mock_interface) { double () }
    let(:mock_eval_game) { double () }
    let(:mock_validation) { double () } 
    let(:game_loop) {GameLoop.new(mock_board, mock_interface, mock_eval_game, mock_validation)}
    
    describe ".instructions" do 

      context "player 1 enters a valid move and it is the winning move and Player 1 is an 'X' and Player 2 is an 'O'" do 
        it "runs through a game of tic tac toe" do 
          board0 = ["X", "1", "X", "3", "4", "5", "O", "O", "8"] 
          board1 = ["X", "X", "X", "3", "4", "5", "O", "O", "8"] 

          expect(mock_board).to receive(:nine_space_array).and_return(board0).exactly(2).times
          expect(mock_interface).to receive(:move_messages).with(board0).and_return("1")
          expect(mock_validation).to receive(:board_conditions?).with(board0, "1").and_return(true)

          expect(mock_board).to receive(:fill).with("1", "X").and_return(board1)
          
          expect(mock_board).to receive(:nine_space_array).and_return(board1)
          expect(mock_eval_game).to receive(:won?).with(board1).and_return(true)

          expect(mock_board).to receive(:nine_space_array).and_return(board1)
          expect(mock_interface).to receive(:display_board).and_return(board1)         

          expect(game_loop.instructions(nil, "X", "O")).to eq("1")
          
        end
      end

      context "a player enters an invalid move, Player 1 is 'X' and Player 2 is 'O'" do 
        it "prompts the user to enter a move" do  
          board0 = ["X", "1", "X", "3", "4", "5", "O", "O", "8"] 
          board1 = ["X", "1", "X", "X", "4", "5", "O", "O", "8"] 
          board2 = ["X", "1", "X", "X", "4", "5", "O", "O", "O"] 

          expect(mock_board).to receive(:nine_space_array).and_return(board0).exactly(3).times
          expect(mock_interface).to receive(:move_messages).with(board0).and_return("0")
          
          expect(mock_validation).to receive(:board_conditions?).with(board0, "0").and_return(false)
          expect(mock_interface).to receive(:valid_move_message).exactly(1).times
          expect(mock_interface).to receive(:player_move).and_return("3")

          expect(mock_validation).to receive(:board_conditions?).with(board0, "3").and_return(true)

          expect(mock_board).to receive(:fill).with("3", "X").and_return(board1)

          expect(mock_board).to receive(:nine_space_array).and_return(board1)
          expect(mock_eval_game).to receive(:won?).with(board1).and_return(false)

          expect(mock_board).to receive(:nine_space_array).and_return(board1)
          expect(mock_eval_game).to receive(:tied?).and_return(false)
          
          expect(mock_board).to receive(:nine_space_array).and_return(board1).exactly(2).times
          expect(mock_interface).to receive(:move_messages).with(board1).and_return("8")
          
          expect(mock_validation).to receive(:board_conditions?).with(board1, "8").and_return(true)

          expect(mock_board).to receive(:fill).with("8", "O").and_return(board2)

          expect(mock_board).to receive(:nine_space_array).and_return(board2)
          expect(mock_eval_game).to receive(:won?).with(board2).and_return(true)

          expect(mock_board).to receive(:nine_space_array).and_return(board2)
          expect(mock_interface).to receive(:display_board).and_return(board2)

          expect(game_loop.instructions(nil, "X", "O")).to eq("2")
          

        end
      end
    end
  end
end
