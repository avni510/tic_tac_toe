module TicTacToe

  class SymbolLoop

    def initialize(validation, interface)
      @validation = validation
      @interface = interface 
    end

    def symbol_selection
      @interface.select_symbol_message
      p1_symbol = symbol_selection_loop
      p1_symbol = p1_symbol.upcase
      p2_symbol = symbol_assignment(p1_symbol)
      @interface.puts_symbols(p1_symbol, p2_symbol)
      return p1_symbol, p2_symbol 
    end

    def symbol_selection_loop
      symbol = @interface.select_symbol
      until @validation.symbol_conditions?(symbol)
        @interface.valid_symbol_message
        symbol = @interface.select_symbol
      end
      symbol
    end

    def symbol_assignment(p1_symbol)
      if p1_symbol.eql? "O"
        return "X"
      elsif p1_symbol.eql? "X"
        return "O"
      end
    end
  end
end
