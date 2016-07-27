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
    symbol_selection   
    game_loop 
    finished_game
  end

private

  def symbol_selection
    @console_int.select_symbol
    @console_int.puts_space
    @console_int.puts_symbols     
    @console_int.puts_space
  end

  def game_loop
    until game_over?
      @console_int.player_turn_message(1)
      @console_int.puts_space 
      fill_board(@console_int.player1_symbol)
      @console_int.puts_space 
      @console_int.player_turn_message(2)
      @console_int.puts_space
      fill_board(@console_int.player2_symbol) unless game_over? 
    end
  end

  def game_over?
    @eval_game.tied?(@board.board_array) || @eval_game.won?(@board.board_array)
  end

  def fill_board(symbol) 
    move = @console_int.move_messages(@board.board_array)
    until @board.fill(move, symbol) do 
      @console_int.puts_space
      @console_int.valid_move_message
      move = @console_int.move_messages(@board.board_array)
    end
    @board.fill(move, symbol)
  end

  def finished_game
    @console_int.puts_space
    @console_int.display_board(@board.board_array)
    @console_int.puts_space
    @console_int.game_over_message
  end
end
