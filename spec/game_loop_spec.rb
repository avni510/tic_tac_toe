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

    def valid_move_loop(board, move)
      expect(validation).to receive(:board_conditions?).with(board, move).and_return(true)
      move
    end
    
    let(:eval_game) { EvalGame.new }
    let(:validation) { Validation.new }
    let(:interface) { double }

    describe ".instructions" do 
      before(:each) do
#        allow(interface).to receive(:player_move)
#        allow(interface).to receive(:display_board)
#        allow(interface).to receive(:player_move_message)
        allow(interface).to receive(:move_messages)
#        allow(validation).to receive(:board_conditions?)
#        allow(interface).to receive(:valid_move_message)
#        allow(interface).to receive(:pllayer_move)
      end


      context "space 2 is the winning move" do 
        it "returns a '1' if player 1 wins" do
          board = create_board([
            "X", "X", "2",
            "O", "4", "5",
            "6", "7", "O"
            ])
          
          allow(interface).to receive(:move_messages).with(board.nine_space_array).and_return('2')
          
          valid_move_loop(board.nine_space_array, '2')

          board.fill('2', "X")

          expect(eval_game).to receive(:won?).with(board.nine_space_array).and_return(true)
          
          game_loop = GameLoop.new(board, interface, eval_game, validation)

          result = game_loop.instructions("1", "X")
          expect(result).to eq("1")
        end
      end

      context "space 6 is the winning move" do 
        it "returns a '1' if player 1 wins" do
          board = create_board([
          "0", "1", "X",
          "O", "X", "O",
          "6", "7", "8"
          ])

          allow(interface).to receive(:move_messages).with(board.nine_space_array).and_return('6')
          
          valid_move_loop(board.nine_space_array, '6')
          
          board.fill('6', "X")

          expect(eval_game).to receive(:won?).with(board.nine_space_array).and_return(true)

          game_loop = GameLoop.new(board, interface, eval_game, validation)

          result = game_loop.instructions("1", "X")
          expect(result).to eq("1")
        end 
      end

      context "space 5 is the winnign move" do 
        it "returns a '2' if player 2 wins" do
          board = create_board([
            "X", "1", "2",
            "O", "O", "5",
            "6", "X", "X"
          ])

          allow(interface).to receive(:move_messages).with(board.nine_space_array).and_return("5")
          
          valid_move_loop(board.nine_space_array, '5')

          board.fill('5', 'O')

          expect(eval_game).to receive(:won?).with(board.nine_space_array).and_return(true)
          game_loop = GameLoop.new(board, interface, eval_game, validation)

          result = game_loop.instructions("2", "O")
          expect(result).to eq("2")
        end
      end

      it "returns 'tied' for a tie game" do
        board = create_board([
          "O", "1", "X", 
          "X", "O", "O", 
          "O", "X", "X"
        ])
        
        allow(interface).to receive(:move_messages).with(board.nine_space_array).and_return('1')

        valid_move_loop(board.nine_space_array, '1')
       
        board.fill('1', "X")
        
        expect(eval_game).to receive(:won?).with(board.nine_space_array).and_return(false)

        expect(eval_game).to receive(:tied?).with(board.nine_space_array).and_return(true)
        
        game_loop = GameLoop.new(board, interface, eval_game, validation)


        result = game_loop.instructions("2", "X")
        expect(result).to eq("tied")
      end

      context "it is the player's turn with marker O" do 
        it "fills the board with the user's move" do 
          board = create_board([
            "X", "1", "2",
            "O", "O", "5",
            "6", "X", "X"
          ])

          allow(interface).to receive(:move_messages).with(board.nine_space_array).and_return("2")
          
          expect(board).to receive(:fill).with("2", "O")
          
          game_loop = GameLoop.new(board, interface, eval_game, validation)

          game_loop.instructions("2", "O")
        end
      end

      context "it is the player's turn with marker X" do 
        it "fills the board with the user's move" do 
          board = create_board([
            "X", "1", "2",
            "O", "O", "5",
            "6", "X", "X"
          ])

          allow(interface).to receive(:move_messages).with(board.nine_space_array).and_return("1")
          
          expect(board).to receive(:fill).with("1", "O")
          
          game_loop = GameLoop.new(board, interface, eval_game, validation)

          game_loop.instructions("2", "O")
        end
      end

      context 'the player enters an invalid position' do 
        it 'prompts the user to enter their move again' do 
          board = create_board([
            "X", "1", "2",
            "O", "O", "5",
            "6", "X", "X"
          ])

          allow(interface).to receive(:move_messages).with(board.nine_space_array).and_return("0")

          expect(validation).to receive(:board_conditions?).with(board.nine_space_array, "0").and_return(false)

          expect(interface).to receive(:valid_move_message)

          expect(interface).to receive(:player_move).and_return('5')

          expect(validation).to receive(:board_conditions?).with(board.nine_space_array, "5").and_return(true)
          
          game_loop = GameLoop.new(board, interface, eval_game, validation)

          game_loop.instructions("2", "O")
        end
      end

      context 'the game is neither won or tied' do 
        it 'returns nil' do 
          board = create_board([
             "X", "1", "2", 
             "3", "4", "5", 
             "6", "7", "O"
            ])
          
            allow(interface).to receive(:move_messages).with(board.nine_space_array).and_return("7")

            game_loop = GameLoop.new(board, interface, eval_game, validation)

            result = game_loop.instructions("1", "X")
            expect(result).to eq(nil)
        end
      end
    end
  end
end
