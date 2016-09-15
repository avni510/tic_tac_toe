module TicTacToe
  require "spec_helper"

  describe HardComputer do
    
    before(:each) do
      hard_comp_params = 
        { opponent_marker: 'O',
          game_eval: GameEval.new,
          player_marker: 'X'
        }
      @hard_computer = HardComputer.new(hard_comp_params)
    end

    it "should return the best move" do

      board = Board.new(
        [
          "O", "O", "2",
          "3", "X", "5",
          "X", "O", "X"
        ])

      expect(@hard_computer.generate_move(board)).to eq(1)
    end
  end
end
