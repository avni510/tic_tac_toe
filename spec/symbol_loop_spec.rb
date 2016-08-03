module TicTacToe
  require "symbol_loop"


  describe SymbolLoop do 

    let(:mock_validation) { double () } 
    let(:mock_interface) { double () } 
    let(:symbol_loop) { SymbolLoop.new(mock_validation, mock_interface) }
  
    describe ".symbol_selection" do 
      context "the user selects a valid symbol" do 
        it "allows the user to select their symbols" do 
          expect(mock_interface).to receive(:select_symbol).and_return("X")
          expect(mock_interface).to receive(:puts_space).exactly(2).times
          expect(mock_validation).to receive(:symbol_conditions?).with("X").and_return(true)

          expect(mock_interface).to receive(:puts_symbols) 

          symbol_loop.symbol_selection
          expect(symbol_loop.player1_symbol).to eq("X")
          expect(symbol_loop.player2_symbol).to eq("O")
        end
      end

      context "the user does not select a valid symbol" do 
        it "displays a message to enter a valid symbol and allows them to enter another symbol" do 
          expect(mock_interface).to receive(:select_symbol).and_return("y")
          expect(mock_interface).to receive(:puts_space).exactly(3).times

          expect(mock_validation).to receive(:symbol_conditions?).with("y").and_return(false)
          expect(mock_interface).to receive(:valid_symbol_message).exactly(1).times
          expect(mock_interface).to receive(:select_symbol).and_return("o")
          expect(mock_validation).to receive(:symbol_conditions?).with("o").and_return(true)


          expect(mock_interface).to receive(:puts_symbols) 
          symbol_loop.symbol_selection
          expect(symbol_loop.player1_symbol).to eq("O")
          expect(symbol_loop.player2_symbol).to eq("X")
        end
      end 
    end
  end
end
