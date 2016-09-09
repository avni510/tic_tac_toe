module TicTacToe
  require "spec_helper"
  
  describe Computer do
    let(:validation) { Validation.new }
    let(:mock_console_ui) { double }
    let(:board) {Board.new}

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
    end

    it "returns the player's marker" do
      args = 
        {
          :board => board,
          :console_ui => mock_console_ui,
          :validation => validation
        }
      computer = Computer.new('X', args)
      expect(computer.marker).to eq('X')
    end

    describe ".make_move" do
      context "the move the computer selects is open" do
        it "randomly selects a move and returns a board object" do
          args = 
            {
              :board => board, 
              :console_ui => mock_console_ui,
              :validation => validation
            }
          computer = Computer.new('X', args)

          result = computer.make_move(computer.board)

          expect(result).to be_a_kind_of(Board)
        end
      end
#
#      context "the move the computer selects is not open" do
#
#        it "selects another move" do
#          current_board = create_board(
#            [ 
#              "X", "O", "X",
#              "3", "O", "X", 
#              "6", "7", "8",
#            ])
#
#          args = 
#            {
#              :board => current_board,
#              :console_ui => mock_console_ui,
#              :validation => Validation.new
#            }
#            j
#          computer = Computer.new('X', args)
#
##          allow(Kernel).to receive(:rand).and_return(0)
#
#
#          result = computer.make_move(computer.board)
#
#          expect(result).to be_a_kind_of(Board)
#        end
#      end
    end
  end
end
