module TicTacToe
  require 'spec_helper'

  describe Board do 

    let(:board) {Board.new}

    it "returns a blank board" do 
      grid = [
        "0", "1", "2", 
        "3", "4", "5", 
        "6", "7", "8"
      ]  
      expect(board.cells).to eq(grid)
    end

    describe ".fill" do 
      it "returns a board with a filled in space" do 

      position, marker = "2", "X"

      board_prior_to_move = Board.new([
        "0", "1", "2", 
        "3", "4", "5", 
        "6", "7", "8"
      ])


      board_after_move = Board.new([
        "0", "1", "#{marker}", 
        "3", "4", "5", 
        "6", "7", "8"
      ])
    
      result_board = board.fill(position, marker)

      result_cells = result_board.cells
      
      expect(result_cells).to eq(board_after_move.cells)
      end
    end
  end
end
