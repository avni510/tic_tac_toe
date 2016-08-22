module TicTacToe
  require 'spec_helper'

  describe Validation do 

    let (:validation) {Validation.new}

    describe ".board_conditions?" do 

      board = [
        "O", "1", "2", 
        "X", "4", "5", 
        "6", "7", "8"
      ]
      it "can check if a valid board position was entered" do 
        [ ["5", true],
          ["10", false]
        ].each do |position, bool|
          expect(validation.board_conditions?(board, position)).to eq(bool)
        end
      end
    
      it "can check if the move entered is open" do 
        expect(validation.board_conditions?(board, '0')).to eq(false)
      end
    end

    describe ".symbol_conditions?" do 
      
      it "can check if a valid symbol was entered" do 
        [ ["p", false], 
          ["o", true],
        ]

      end
    end
  end
end
