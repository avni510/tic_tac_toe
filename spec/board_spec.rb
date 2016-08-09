module TicTacToe
  require "board"

  describe Board do 

    let(:board) {Board.new}

    it "returns a blank board" do 
      grid = [
        "0", "1", "2", 
        "3", "4", "5", 
        "6", "7", "8"
      ]  
      expect(board.nine_space_array).to eq(grid)
    end

    describe ".fill" do 
      [
        ["2", "X"], 
        ["2", "O"]
      ].each do |position, symbol|
        it "returns a board with a filled in space" do 
          grid = [
            "0", "1", "#{symbol}", 
            "3", "4", "5", 
            "6", "7", "8"
          ]  
          expect(board.fill(position, symbol)).to eq(grid)
        end
      end

    end
  end
end
