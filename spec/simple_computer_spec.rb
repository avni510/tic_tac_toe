module TicTacToe
  require "spec_helper"

  describe SimpleComputer do

    let(:simple_computer){ SimpleComputer.new({}) }

    describe ".generate_move" do

      it "randomly selects a move and returns a board object" do
        initial_board = Board.new(
          [ 
            "0", "1", "2",
            "3", "4", "5", 
            "6", "7", "8"
          ])

        result = simple_computer.generate_move(initial_board)

        range_of_values = [*0..8]

        generated_value = range_of_values.include?(result)

        expect(generated_value).to eq(true)
      end
    end
  end
end
