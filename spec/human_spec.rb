require 'pry'
module TicTacToe
  require 'spec_helper'

  describe Human do 

   before(:each) do
     @mock_console_ui = double
     @args = 
       { 
         console_ui: @mock_console_ui
       }
   end

   it "returns the player's marker" do
     @args = @args.merge(player_marker: 'O')
     human = Human.new(@args)
     expect(human.player_marker).to eq('O')
   end
    
   describe ".make_move" do
      def validate_move(human, move)
        expect(human).to receive(:valid_move_loop).and_return(move)
      end

      before(:each) do 
        allow(@mock_console_ui).to receive(:move_messages)
        allow(@mock_console_ui).to receive(:move_selection_message)
      end

      context "the game is a space away from being won" do
        move = '2'
      
        ['X', 'O'].each do |marker|

          context "space #{move} is the winning move" do 
            it "returns the winning board" do 

              board_before_player_move = Board.new(
                [
                  "O", "O", "2",
                  "3", "X", "5",
                  "X", "O", "X"
                ])

              @args = @args.merge(player_marker: marker)

              human = Human.new(@args)

              board_before_player_move_array = board_before_player_move.cells

              allow(@mock_console_ui).to receive(:move_messages).with(board_before_player_move_array, marker)

              allow(@mock_console_ui).to receive(:user_input).and_return(move)

              validate_move(human, move)

              board_before_player_move.fill(move, human.player_marker)

              board_after_player_move = Board.new(
                [
                  "O", "O", "#{marker}",
                  "3", "X", "5",
                  "X", "O", "X"
                ])

              board_after_player_move_array = board_after_player_move.cells

              result = human.make_move(board_before_player_move)
              
              expect(result.cells).to eq(board_after_player_move_array)
            end
          end
        end
      end

      context 'the game is a space away from being tied' do 

        move = '1'
        marker = 'X'

        it 'returns the tied board' do         
          board_before_player_move = Board.new([
            "O", "1", "X", 
            "X", "O", "O", 
            "O", "X", "X"
          ])

          @args = @args.merge(player_marker: marker)
          
          human = Human.new(@args)
        
          allow(@mock_console_ui).to receive(:user_input).and_return(move) 
          
          validate_move(human, move)
         
          board_before_player_move.fill(move, human.player_marker)
          
          board_after_player_move = Board.new(
            [
              "O", "#{marker}", "X", 
              "X", "O", "O", 
              "O", "X", "X"
            ])

          board_after_player_move_array = board_after_player_move.cells

          result = human.make_move(board_before_player_move)

          expect(result.cells).to eq(board_after_player_move_array)
        end
      end

      context 'the game is neither won or tied' do 

        context "player 1 is 'O' the first game and 'X' the second game" do
          it "fills the board with the user's move and marker" do 
            markers = ['O', 'X'].each do |marker|
            
              move = '1'

              board_before_player_move  = Board.new([
                "X", "1", "O",
                "O", "O", "5",
                "6", "X", "X"
              ])

              @args = @args.merge(player_marker: marker)

              human = Human.new(@args)

              allow(@mock_console_ui).to receive(:user_input).and_return(move)

              validate_move(human, move)

              board_after_player_move = Board.new([
                "X", "#{marker}", "O",
                "O", "O", "5",
                "6", "X", "X"
              ])

              board_after_player_move_array = board_after_player_move.cells

              result = human.make_move(board_before_player_move)

              expect(result.cells).to eq(board_after_player_move_array)
            end
          end
        end

        context 'an invalid position is entered' do 
          marker = 'O'
          first_move = "0"
          second_move = "2"

          it 'prompts the user to enter their move again' do 
            board = Board.new([
              "X", "1", "2",
              "O", "O", "5",
              "6", "X", "X"
            ])
            
            @args = @args.merge(player_marker: marker)

            expect(@mock_console_ui).to receive(:user_input).and_return(first_move, second_move)

            expect(@mock_console_ui).to receive(:valid_move_message).exactly(1).times

            human = Human.new(@args)

            human.make_move(board)
          end
        end
      end
    end
  end
end
