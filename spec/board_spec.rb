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

      board = Board.new

      board.fill(position, marker)

      expect(board.cells[2]).to eq("X")
      end
    end

    it "returns the size of the board" do
      board = Board.new
      expect(board.size).to eq(9)
    end

    it "removes the marker from the board given a space" do
      initial_board = Board.new([
        "0", "1", "X", 
        "3", "4", "5", 
        "6", "7", "8"
      ])
      
      initial_board.refill("2")

      expect(initial_board.cells[2]).to eq("2")
    end
  end
end
