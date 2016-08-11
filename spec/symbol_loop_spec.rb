module TicTacToe
  require "symbol_loop"
  
  describe SymbolLoop do 
    let(:mock_console_ui) { double () } 
    let(:validation) { Validation.new }
    let(:symbol_loop) { symbol_loop = SymbolLoop.new(validation, mock_console_ui) }

    before(:each) do 
      allow(mock_console_ui).to receive(:select_symbol_message)
      allow(mock_console_ui).to receive(:select_symbol)
      allow(mock_console_ui).to receive(:puts_symbols).with("X", "O")
    end

    it "returns the markers for both players" do 
      allow(mock_console_ui).to receive(:select_symbol).and_return("X")

      result = symbol_loop.symbol_selection
      expect(result).to eq(["X", "O"])
    end  

    it "prompts the user to select a symbol" do 
      expect(mock_console_ui).to receive(:select_symbol_message)
      
      expect(mock_console_ui).to receive(:select_symbol).and_return("X")

      symbol_loop.symbol_selection
    end

    context "Player 1 chooses 'O'" do 
      it "returns 'X' for Player 2" do 
        expect(mock_console_ui).to receive(:select_symbol).and_return("O")

        allow(mock_console_ui).to receive(:puts_symbols).with("O", "X")

        result = symbol_loop.symbol_selection
        expect(result).to eq(["O", "X"])
      end

      it "displays the symbols of each player" do 
        allow(mock_console_ui).to receive(:select_symbol).and_return("O")

        expect(mock_console_ui).to receive(:puts_symbols).with("O", "X")

        symbol_loop.symbol_selection
      end

      it "returns uppercase markers" do
        allow(mock_console_ui).to receive(:select_symbol).and_return("o")

        allow(mock_console_ui).to receive(:puts_symbols).with("O", "X")

        result = symbol_loop.symbol_selection
        expect(result).to eq(["O", "X"])
      end
    
    end

    context "the player enters an invalid symbol" do 
      it "prompts to the user to enter another symbol" do 
        expect(mock_console_ui).to receive(:select_symbol).and_return('p', 'X')
        
        expect(validation).to receive(:symbol_conditions?).with('p').and_return(false)
        
        expect(mock_console_ui).to receive(:valid_symbol_message)

        expect(validation).to receive(:symbol_conditions?).with('X').and_return(true)
        symbol_loop.symbol_selection
      end
    end
  end
end
