module TicTacToe
  require "spec_helper"

  describe HardComputer do
    
    before(:each) do
      hard_comp_params = 
        { 
          opponent_marker: 'O',
          game_eval: GameEval.new,
          player_marker: 'X',
        }
      @hard_computer = HardComputer.new(hard_comp_params)
    end

    context "the board has one open space" do
      it "returns the open space" do

        board = Board.new(
          [
            "O", "X", "O",
            "O", "X", "5",
            "X", "O", "X"
          ])

        expect(@hard_computer.generate_move(board)).to eq("5")
      end
    end

    context "two spaces are open and one is the winning move" do
      it "generates the winning move" do
        board = Board.new(
          [
            "O", "X", "O",
            "O", "O", "5",
            "X", "7", "X"
          ])

        expect(@hard_computer.generate_move(board)).to eq("7")
      end
    end

    context "three spaces are open" do
      it "generates the first move that is the winning move" do
        board = Board.new(
          [
            "X", "1", "X",
            "3", "O", "O",
            "X", "7", "O"
          ])

        expect(@hard_computer.generate_move(board)).to eq("1")
      end
    end

    context "five spaces are open" do
      it "generates the first move that is the winning move" do
        board = Board.new(
          [
            "0", "1", "2",
            "O", "4", "5",
            "X", "O", "X"
          ])

        expect(@hard_computer.generate_move(board)).to eq("2")
      end

      it "traps the opponent" do
        board = Board.new(
          [
            "O", "1", "2",
            "O", "X", "5",
            "6", "7", "X"
          ])

        expect(@hard_computer.generate_move(board)).to eq("6")
      end
    end

    context "the opponent has a chance of winning" do
      it "blocks the opponent's move" do
        board = Board.new(
          [
            "O", "O", "X",
            "X", "4", "5",
            "6", "7", "O"
          ])

        expect(@hard_computer.generate_move(board)).to eq("4")

        board = Board.new(
          [
            "0", "O", "2",
            "3", "4", "5",
            "X", "O", "X"
          ])

        expect(@hard_computer.generate_move(board)).to eq("4")
      end
    end
    
    context "the opponent has a chance of trapping the computer" do
      it "blocks the opponent's move" do
        board = Board.new(
          [
            "X", "1", "2",
            "3", "O", "5",
            "6", "7", "O"
          ])

        expect(@hard_computer.generate_move(board)).to eq("2")
      end
    end

    context "seven spaces are open" do
      it "generates the first move that is the winning move" do
        board = Board.new(
          [
            "0", "1", "2",
            "3", "4", "O",
            "6", "7", "8"
          ])

        possible_moves = ["0", "2", "6", "8"]
        result = @hard_computer.generate_move(board)

        expect(possible_moves.include?(result)).to eq(true)
      end
    end
  end
end
