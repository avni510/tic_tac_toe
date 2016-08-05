module TicTacToe
  class SymbolLoop
    attr_reader :player1_symbol
    attr_reader :player2_symbol

    def initialize(validation, interface)
      @validation = validation
      @interface = interface
    end

    def hello_world
      puts "hello_world"
    end

    def symbol_selection
      @interface.select_symbol_message
      @player1_symbol = @interface.select_symbol
      symbol_selection_loop
      @player1_symbol.upcase!
      symbol_assignment
      @interface.puts_space
      @interface.puts_symbols(@player1_symbol, @player2_symbol)
      @interface.puts_space
    end

    private 

    def symbol_selection_loop
      until @validation.symbol_conditions?(@player1_symbol) do 
        @interface.valid_symbol_message
        @interface.puts_space
        @player1_symbol = @interface.select_symbol 
      end
      @player1_symbol
    end
    def symbol_assignment
      if @player1_symbol == "X"
        @player2_symbol = "O"
      else
        @player2_symbol = "X"
      end
    end
  end
end
