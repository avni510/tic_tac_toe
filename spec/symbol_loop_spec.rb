module TicTacToe
  require "symbol_loop"
  
  describe SymbolLoop do 
    let(:interface) { double () } 
    let(:validation) { Validation.new }
    let(:symbol_loop) { symbol_loop = SymbolLoop.new(validation, interface) }

    before(:each) do 
      allow(interface).to receive(:select_symbol_message)
      allow(interface).to receive(:select_symbol)
      allow(interface).to receive(:puts_symbols).with("X", "O")
    end

    it "returns the markers for both players" do 
      allow(interface).to receive(:select_symbol).and_return("X")

      result = symbol_loop.symbol_selection
      expect(result).to eq(["X", "O"])
    end  

    it "prompts the user to select a symbol" do 
      expect(interface).to receive(:select_symbol_message)
      
      expect(interface).to receive(:select_symbol).and_return("X")

      symbol_loop.symbol_selection
    end

    context "Player 1 chooses 'O'" do 
      it "returns 'X' for Player 2" do 
        expect(interface).to receive(:select_symbol).and_return("O")

        allow(interface).to receive(:puts_symbols).with("O", "X")

        result = symbol_loop.symbol_selection
        expect(result).to eq(["O", "X"])
      end

      it "displays the symbols of each player" do 
        allow(interface).to receive(:select_symbol).and_return("O")

        expect(interface).to receive(:puts_symbols).with("O", "X")

        symbol_loop.symbol_selection
      end

      it "returns uppercase markers" do
        allow(interface).to receive(:select_symbol).and_return("o")

        allow(interface).to receive(:puts_symbols).with("O", "X")

        result = symbol_loop.symbol_selection
        expect(result).to eq(["O", "X"])
      end
    
    end

    context "the player enters an invalid symbol" do 
      it "prompts to the user to enter another symbol" do 
        expect(interface).to receive(:select_symbol).and_return('p', 'X')
        
        expect(validation).to receive(:symbol_conditions?).with('p').and_return(false)
        
        expect(interface).to receive(:valid_symbol_message)

        expect(validation).to receive(:symbol_conditions?).with('X').and_return(true)
        symbol_loop.symbol_selection
      end
    end
  end
end
