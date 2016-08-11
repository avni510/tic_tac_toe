module TicTacToe

  class SymbolLoop

    def initialize(validation, console_ui)
      @validation = validation
      @console_ui = console_ui 
    end

    def symbol_selection
      @console_ui.select_symbol_message
      p1_symbol = symbol_selection_loop
      p1_symbol = p1_symbol.upcase
      p2_symbol = symbol_assignment(p1_symbol)
      @console_ui.puts_symbols(p1_symbol, p2_symbol)
      return p1_symbol, p2_symbol 
    end

    def symbol_selection_loop
      symbol = @console_ui.select_symbol
      until @validation.symbol_conditions?(symbol)
        @console_ui.valid_symbol_message
        symbol = @console_ui.select_symbol
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
