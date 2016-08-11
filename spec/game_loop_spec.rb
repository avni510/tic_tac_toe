module TicTacToe
  require "game_loop"
  require "board"
  require "validation"
  require "eval_game"

  describe GameLoop do 
    
    def create_board(spaces)
      board = Board.new
      spaces.each_with_index do |marker, index|
        board.fill(index, marker)
      end
      board
    end

    def valid_move_loop(game_loop, move)
      expect(game_loop).to receive(:valid_move_loop).and_return(move)
    end
    
    
    let(:eval_game) { EvalGame.new }
    let(:validation) { Validation.new }
    let(:mock_console_ui) { double }

    describe ".instructions" do 

      context "player 1 is 'X' and it is player 1's turn " do 

        player = 1 

        p1_marker = 'X'

        p1_winning_moves = ['6', '5'].each do | move| 

          context "space #{move} is the winning move" do 
            it "returns a '1' if player 1 wins" do

              board = create_board([
              "O", "O", "X",
              "3", "X", "5",
              "6", "O", "X"
              ])

              game_loop = GameLoop.new(board, mock_console_ui, eval_game, validation)

              allow(mock_console_ui).to receive(:move_messages).with(board.nine_space_array, player, p1_marker).and_return(move)
              valid_move_loop(game_loop, move)

              board.fill(move, p1_marker)

              expect(eval_game).to receive(:won?).with(board.nine_space_array).and_return(true)

              result = game_loop.instructions(player, p1_marker)
              expect(result).to eq(player)
            end
          end
        end

        it "returns 'tied' for a tie game" do
          board = create_board([
            "O", "1", "X", 
            "X", "O", "O", 
            "O", "X", "X"
          ])
          
          game_loop = GameLoop.new(board, mock_console_ui, eval_game, validation)
          
          allow(mock_console_ui).to receive(:move_messages).with(board.nine_space_array, player, p1_marker).and_return('1')

          valid_move_loop(game_loop, '1')
         
          board.fill('1', p1_marker)
          
          expect(eval_game).to receive(:won?).with(board.nine_space_array).and_return(false)

          expect(eval_game).to receive(:tied?).with(board.nine_space_array).and_return(true)
          
          result = game_loop.instructions(player, "X")
          expect(result).to eq("tied")
        end

        context 'the game is neither won or tied' do 
          it 'returns nil' do 
            board = create_board([
               "X", "1", "2", 
               "3", "4", "5", 
               "6", "7", "O"
              ])
            
              allow(mock_console_ui).to receive(:move_messages).with(board.nine_space_array, player, p1_marker).and_return("7")

              game_loop = GameLoop.new(board, mock_console_ui, eval_game, validation)

              result = game_loop.instructions(player, p1_marker)
              expect(result).to eq(nil)
          end
        end
      end

      context "player 2 is 'O' and it is player 2's turn " do 
        player = 2

        p2_marker = 'O'

        p2_winning_moves = ['3', '8'].each do |move|
        
          context "space #{move} is the winning move" do 
            it "returns a '2' if player 2 wins" do
              board = create_board([
                "O", "X", "X",
                "3", "O", "X",
                "O", "X", "8"
              ])

              game_loop = GameLoop.new(board, mock_console_ui, eval_game, validation)

              allow(mock_console_ui).to receive(:move_messages).with(board.nine_space_array, player, p2_marker).and_return(move)
              
              valid_move_loop(game_loop, move)

              board.fill(move, p2_marker)

              expect(eval_game).to receive(:won?).with(board.nine_space_array).and_return(true)

              result = game_loop.instructions(player, p2_marker)
              expect(result).to eq(player)
            end
          end
        end

        context 'an invalid position is entered' do 
          it 'prompts the user to enter their move again' do 
            board = create_board([
              "X", "1", "2",
              "O", "O", "5",
              "6", "X", "X"
            ])

            allow(mock_console_ui).to receive(:move_messages).with(board.nine_space_array, player, p2_marker).and_return("0")

            expect(validation).to receive(:board_conditions?).with(board.nine_space_array, "0").and_return(false)

            expect(mock_console_ui).to receive(:valid_move_message)

            expect(mock_console_ui).to receive(:user_input).and_return('5')

            expect(validation).to receive(:board_conditions?).with(board.nine_space_array, "5").and_return(true)
            
            game_loop = GameLoop.new(board, mock_console_ui, eval_game, validation)

            game_loop.instructions(player, p2_marker)
          end
        end
      end


      context "player 2 is 'O' in the first game and is 'X' in the second game" do 

        player = 2 
        
        p2_markers = ['O', 'X'].each do |marker|

          it "fills the board with the user's move and marker" do 
            board = create_board([
              "X", "1", "2",
              "O", "O", "5",
              "6", "X", "X"
            ])

            allow(mock_console_ui).to receive(:move_messages).with(board.nine_space_array, player,marker).and_return("1")
            
            expect(board).to receive(:fill).with("1", marker)
            
            game_loop = GameLoop.new(board, mock_console_ui, eval_game, validation)

            game_loop.instructions(player, marker)
          end
        end
      end


    end
  end
end
