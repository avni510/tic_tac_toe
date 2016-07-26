require_relative "board"
require_relative "eval_game"
require_relative "console_interface"
require_relative "wrapperio"


class Game

	def initialize
		@board = Board.new
		@eval_game = EvalGame.new
		@console_int = ConsoleInterface.new(WrapperIO.new)
	end

	 def run
		@console_int.select_symbol
		@console_int.puts_symbols
	 	game_loop	
    @console_int.display_board(@board.board)
		@console_int.game_over_message
	 end

   def game_loop
    until game_over?
      fill_board(@console_int.player1_symbol)
      fill_board(@console_int.player2_symbol)	unless game_over? 
    end
  end

	 def game_over?
    @eval_game.tied?(@board.board) || @eval_game.won?(@board.board)
	 end

	 def fill_board(symbol)
     move = @console_int.move_messages(@board.board)
  	until @board.fill(move, symbol) do 
      @console_int.valid_move_message
      move = @console_int.move_messages(@board.board)
    end
    @board.fill(move, symbol)
	end
  end
