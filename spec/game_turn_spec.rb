module TicTacToe
  require "game_turn"
  require "board"
  require "validation"
  require "eval_game"

  describe GameTurn do 
    
    def create_board(spaces)
      board = Board.new
      spaces.each_with_index do |marker, index|
        board.fill(index, marker)
      end
      board
    end

    def valid_move_loop(game_turn, move)
      expect(game_turn).to receive(:valid_move_loop).and_return(move)
    end
    
    
    let(:eval_game) { EvalGame.new }
    let(:validation) { Validation.new }
    let(:mock_console_ui) { double }

    describe ".execute" do 
      before(:each) do 
        allow(mock_console_ui).to receive(:display_board)
        allow(mock_console_ui).to receive(:move_messages)
      end

      context "the game is a space away from being won" do
        move = '2'
      
        [
          [1, 'X'],
          [2, 'O']
        ].each do |player_num, marker|

          context "space #{move} is the winning move" do 
            it "returns a '#{player_num}' if player #{player_num} wins" do

              board = create_board([
              "O", "O", "2",
              "3", "X", "5",
              "X", "O", "X"
              ])

              game_turn = GameTurn.new(board, mock_console_ui, eval_game, validation)

              allow(mock_console_ui).to receive(:move_messages).with(board.nine_space_array, player_num, marker).and_return(move)

              valid_move_loop(game_turn, move)

              board.fill(move, marker)

#              expect(eval_game).to receive(:won?).with(board.nine_space_array).and_return(true)

              result = game_turn.execute(player_num, marker)
              expect(result).to eq(player_num)
            end
          end
        end
      end

      context 'the game is a space away from being tied' do 

        player_num = 1
        move = '1'
        marker = 'X'

        it "returns '0' for a tie game" do
          board = create_board([
            "O", "1", "X", 
            "X", "O", "O", 
            "O", "X", "X"
          ])
          
          game_turn = GameTurn.new(board, mock_console_ui, eval_game, validation)
          
#          allow(mock_console_ui).to receive(:move_messages).with(board.nine_space_array, player_num, marker).and_return(move)

          valid_move_loop(game_turn, move)
         
          board.fill(move, marker)
          
#          expect(eval_game).to receive(:won?).with(board.nine_space_array).and_return(false)

#          expect(eval_game).to receive(:tied?).with(board.nine_space_array).and_return(true)
          
          result = game_turn.execute(player_num, marker)
          expect(result).to eq(0)
        end
      end

      context 'the game is neither won or tied' do 

        player_num = 1
        marker = 'X'
        
        it 'returns nil if the game is neither won or tied' do 
          move = '7'
          
          board = create_board([
             "X", "1", "2", 
             "3", "4", "5", 
             "6", "7", "O"
            ])
          
#          allow(mock_console_ui).to receive(:move_messages).with(board.nine_space_array, player_num, marker).and_return(move)

          game_turn = GameTurn.new(board, mock_console_ui, eval_game, validation)

          valid_move_loop(game_turn, move)

          result = game_turn.execute(player_num, marker)
          expect(result).to eq(nil)
        end

        context "player 1 is 'O' the first game and 'X' the second game" do
          it "fills the board with the user's move and marker" do 
            markers = ['O', 'X'].each do |marker|
            
              move = '1'

              board = create_board([
                "X", "1", "O",
                "O", "O", "5",
                "6", "X", "X"
              ])


              game_turn = GameTurn.new(board, mock_console_ui, eval_game, validation)

#              allow(mock_console_ui).to receive(:move_messages).with(board.nine_space_array, player_num, marker).and_return(move)
              
              valid_move_loop(game_turn, move)

#              expect(board).to receive(:fill).with(move, marker)

              game_turn.execute(player_num, marker)

            end
          end
        end

        context 'an invalid position is entered' do 
          player_num = 2
          marker = 'O'
          first_move = "0"
          second_move = "2"

          it 'prompts the user to enter their move again' do 
            board = create_board([
              "X", "1", "2",
              "O", "O", "5",
              "6", "X", "X"
            ])

#            allow(mock_console_ui).to receive(:move_messages).with(board.nine_space_array, player_num, marker).and_return(first_move)

            # not sure which is a better way? 
        
            bool = validation.board_conditions?(board.nine_space_array, first_move)
            
            until bool 
              expect(mock_console_ui).to receive(:valid_move_message)

              expect(mock_console_ui).to receive(:user_input).and_return(second_move)

              bool = validation.board_conditions?(board.nine_space_array, second_move)
            end

              
  #            expect(validation).to receive(:board_conditions?).with(board.nine_space_array, first_move).and_return(false)
  #
  #            expect(mock_console_ui).to receive(:valid_move_message)
  #
  #            expect(mock_console_ui).to receive(:user_input).and_return(second_move)
  #
  #            expect(validation).to receive(:board_conditions?).with(board.nine_space_array, second_move).and_return(true)
            
            game_turn = GameTurn.new(board, mock_console_ui, eval_game, validation)

            game_turn.execute(player_num, marker)
          end
        end
      end
    end
  end
end
