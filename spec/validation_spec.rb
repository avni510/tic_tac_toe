module TicTacToe
  require 'spec_helper'

  describe Validation do 

    let (:validation) {Validation.new}

    describe ".move_valid?" do 

      it "checks if a valid board position was entered" do 
        board = [
          "O", "1", "2", 
          "X", "4", "5", 
          "6", "7", "8" ]

        [ 
          ["5", true],
          ["10", false], 
          ["3", false]
        ].each do |position, bool|
          expect(validation.move_valid?(board, position)).to eq(bool)
        end
      end
    end

    describe ".marker_valid?" do 
      
      it "can check if a valid symbol was entered" do 
        [ 
          ["p", false], 
          ["o", true], 
          ['X', true]
        ].each do |marker, bool|
          expect(validation.marker_valid?(marker)).to eq(bool)
        end
      end
    end
  end
end
