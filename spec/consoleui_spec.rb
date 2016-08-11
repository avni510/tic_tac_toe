module TicTacToe
  require "consoleui"

  describe ConsoleUI do 
    let(:mockio) { double() }
    let(:console_ui) { ConsoleUI.new(mockio) }

    describe ".select_marker" do 
      it "prompts the user to select their symbol" do 
        expect(mockio).to receive(:get_action).and_return("X")
        console_ui.select_marker
      end
    end

    describe ".select_marker_message" do 
      it "prints a choice of symbols for the user" do 
        expect(mockio).to receive(:puts_string).with("Player 1 please enter either 'X' or 'O' for your symbol").exactly(1).times
        console_ui.select_marker_message
      end
    end

    describe ".valid_marker_message" do 
      context "the user does not enter either an X or an O" do 
        it "prints a message to enter a valid symbol" do 
          expect(mockio).to receive(:puts_string).with("Please enter a valid symbol").exactly(1).times
          console_ui.valid_marker_message
        end
      end
    end
    
    describe ".puts_markers" do 
      context "Player 1 selects a X as their symbol and Player 2 is O" do 
        it "can display each player's markers" do 
          expect(mockio).to receive(:puts_string).with("Player 1's symbol is X and Player 2's symbol is O").exactly(1).times
          console_ui.puts_markers("X", "O")
        end
      end
    end
    
    describe ".display_board" do  
      it "can display the current state of the board" do 
        expect(mockio).to receive(:puts_string).with(" 0 | 1 | 2 \n===+===+===\n X | O | 5 \n===+===+===\n O | 7 | 8 \n").exactly(1).times
        board = [
          "0", "1", "2", 
          "X", "O", "5", 
          "O", "7", "8"
        ]
        console_ui.display_board(board)
      end
    end


    describe ".player_move" do 
      it "prompts the user for their move on the board" do 
        expect(mockio).to receive(:get_action).and_return("1")
        expect(console_ui.player_move).to eq("1")
      end 
    end

    describe ".player_move_message" do 
      it "prompts the user for their move on the board" do 
        expect(mockio).to receive(:puts_string).with("Please select your move by entering a number 0 to 8").exactly(1).times
        console_ui.player_move_message
      end 
    end

    describe ".valid_move_message" do 	
      context "the user does not enter a number 0 to 8 or the position on the board is taken" do
        it "prints a message to enter a valid move" do 
          expect(mockio).to receive(:puts_string).with("Please enter a valid move").exactly(1).times
          console_ui.valid_move_message
        end
      end
    end

    describe ".player_turn_message" do 
      context "It is Player 1's turn to select their move" do 
        it "prints which player's turn it is" do 
          expect(mockio).to receive(:puts_string).with("It is Player 1's turn").exactly(1).times
          console_ui.player_turn_message(1)
        end
      end
    end

    describe ".puts_space" do 
      it "prints an empty string" do 
        expect(mockio).to receive(:puts_string).with("").exactly(1).times
        console_ui.puts_space
      end
    end

    describe ".won_message" do 
      context "Player 1 wins the game" do 
        it "prints which player has won" do
          expect(mockio).to receive(:puts_string).with("Player 1 has won").exactly(1).times
          console_ui.won_message(1)
        end
      end
    end

    describe ".tied_message" do 
      it "prints the game is tied" do 
        expect(mockio).to receive(:puts_string).with("The game ended in a tie").exactly(1).times
        console_ui.tied_message
      end
    end
  end
end
