module TicTacToe
  require "spec_helper"
  
  describe Computer do
    let(:mock_console_ui) { double }

    def create_board(spaces)
      board = Board.new
      spaces.each_with_index do |marker, index|
        board.fill(index, marker)
      end
      board
    end

    before(:each) do
      allow(mock_console_ui).to receive(:move_messages)
      allow(mock_console_ui).to receive(:computer_move_message)
      @computer = Computer.new('X', mock_console_ui)
    end

    it "returns the player's marker" do
      expect(@computer.marker).to eq('X')
    end

    describe ".make_move" do
      context "the move the computer selects a move that is open" do
        it "randomly selects a move and returns a board object" do
          initial_board = create_board([ 
            "0", "1", "2",
            "3", "4", "5", 
            "6", "7", "8"
          ])
          
          result = @computer.make_move(initial_board)

          expect(result).to be_a_kind_of(Board)
        end
      end

      context "the move the computer selects a move that is not open" do

        it "selects another move" do
          initial_board = create_board(
            [ 
              "X", "O", "X",
              "3", "O", "X", 
              "6", "7", "8",
            ])

          allow(Random).to receive(:rand).and_return(0, 6)


          board_after_computer_move = create_board(
            [ 
              "X", "O", "X",
              "3", "O", "X", 
              "X", "7", "8",
            ])

          result_board = @computer.make_move(initial_board)

          result_array = result_board.nine_space_array
          
          board_after_computer_move_array = board_after_computer_move.nine_space_array

          expect(result_array).to eq(board_after_computer_move_array)
        end
      end
    end
  end
end
