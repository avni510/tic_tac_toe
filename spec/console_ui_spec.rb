module TicTacToe
  require 'spec_helper'

  describe ConsoleUI do 
    let(:mock_wrapper) { double }
    let(:console_ui) { ConsoleUI.new(mock_wrapper) }

    describe ".user_input" do 
      user_input = ['X', '1'].each do |input|
        it "prompts the user to enter into the console" do 
          expect(mock_wrapper).to receive(:get_action).and_return(input)
          expect(console_ui).to receive(:puts_space)
          console_ui.user_input
        end
      end
    end

    describe ".select_marker_message" do 
      it "prints a choice of symbols for the user" do 
        expect(mock_wrapper).to receive(:puts_string).with("Please enter either 'X' or 'O' for your symbol").exactly(1).times
        console_ui.select_marker_message
      end
    end

    describe ".valid_marker_message" do 
      context "the user does not enter either an X or an O" do 
        it "prints a message to enter a valid symbol" do 
          expect(mock_wrapper).to receive(:puts_string).with("Please enter a valid symbol").exactly(1).times
          console_ui.valid_marker_message
        end
      end
    end
    
    describe ".puts_markers" do 
      context "Player 1 selects a X as their symbol and Player 2 is O" do 
        it "can display each player's markers" do 
          expect(mock_wrapper).to receive(:puts_string).with("Player 1's symbol is X and Player 2's symbol is O").exactly(1).times
          console_ui.puts_markers("X", "O")
        end
      end
    end
    
    describe ".display_board" do  
      it "can display the current state of the board" do 
        expect(mock_wrapper).to receive(:puts_string).with(" 0 | 1 | 2 \n===+===+===\n X | O | 5 \n===+===+===\n O | 7 | 8 \n").exactly(1).times
        board = [
          "0", "1", "2", 
          "X", "O", "5", 
          "O", "7", "8"
         ]
        console_ui.display_board(board)
      end
    end

    describe ".move_selection_message" do 
      it "prompts the user for their move on the board" do 
        expect(mock_wrapper).to receive(:puts_string).with("Please select your move by entering a number 0 to 8").exactly(1).times
        console_ui.move_selection_message
      end 
    end


    describe ".player_turn_message" do 
      context "it is Player 1's turn and they have 'X' as their marker" do 
        it "displays which player's turn it is and which marker they have" do
      
          expect(mock_wrapper).to receive(:puts_string).with("It is Player X's turn")
          console_ui.player_turn_message('X')
        end
      end
    end

    describe ".move_messages" do 
      context "it is player 1's turn and their marker is 'O' " do 
        marker = 'O'

        it "displays the appropiate messages for a user's turn" do 
          board = [
            "0", "1", "2", 
            "X", "O", "5", 
            "O", "7", "8"
          ]

          expect(console_ui).to receive(:player_turn_message).with(marker)

          expect(console_ui).to receive(:display_board).with(board)
          
          expect(console_ui).to receive(:puts_space).exactly(2).times
          console_ui.move_messages(board, marker)
        end
      end
    end    

    describe ".valid_move_message" do 	
      context "the user does not enter a number 0 to 8 or the position on the board is taken" do
        it "prints a message to enter a valid move" do 
          expect(mock_wrapper).to receive(:puts_string).with("Please enter a valid move").exactly(1).times
          console_ui.valid_move_message
        end
      end
    end

    describe ".puts_space" do 
      it "prints an empty string" do 
        expect(mock_wrapper).to receive(:puts_string).with("").exactly(1).times
        console_ui.puts_space
      end
    end

    describe ".won_message" do 
      context "Player 1 wins the game" do 
        it "prints which player has won" do
          expect(mock_wrapper).to receive(:puts_string).with("Player X has won").exactly(1).times
          console_ui.won_message("X")
        end
      end
    end

    describe ".tied_message" do 
      it "prints the game is tied" do 
        expect(mock_wrapper).to receive(:puts_string).with("The game ended in a tie").exactly(1).times
        console_ui.tied_message
      end
    end

    describe ".game_menu_messages" do
      it "prints the appropiate messages before the game menu is shown" do
        expect(mock_wrapper).to receive(:puts_string).with("Please select which type of game you would like to play")
        expect(console_ui).to receive(:puts_space).exactly(2).times
        expect(mock_wrapper).to receive(:puts_string).with("Enter the number next to the choice")
        console_ui.game_menu_messages
      end
    end

    describe ".display_game_menu" do 
      it "prints the game menu" do
        menu_options = {
          '1' => "1. Human v. Human", 
          '2' => "2. Human v. Simple Computer"
        }
        expect(mock_wrapper).to receive(:puts_string).exactly(2).times
        expect(console_ui).to receive(:puts_space)
        console_ui.display_game_menu(menu_options)
      end
    end

    describe ".valid_menu_choice" do
      it "prints a message to enter a valid menu choice if an invalid one is entered" do
        expect(mock_wrapper).to receive(:puts_string).with("Please enter a valid menu option")
        console_ui.valid_menu_choice
      end
    end

    describe ".computer_move_message" do
      it "prints a message to the console of where the computer will move" do
        expect(mock_wrapper).to receive(:puts_string).with("The computer will fill space 6")
        expect(console_ui).to receive(:puts_space)
        console_ui.computer_move_message('6')
      end
    end
  end
end
