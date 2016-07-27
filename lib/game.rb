module TicTacToe

  class Game

    def initialize
      @board = Board.new
      @eval_game = EvalGame.new
      @console_int = ConsoleInterface.new(WrapperIO.new)
      @player_won = nil
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
      until @eval_game.game_over?(@board.nine_space_array)
        player_move(1, @console_int.player1_symbol) 
        unless @eval_game.game_over?(@board.nine_space_array)
          player_move(2, @console_int.player2_symbol) 
        else
          @player_won = 1
        end
      end
     @player_won = 2 unless @player_won 
    end
    
    def valid_move_loop(move, symbol)
      until @board.fill(move, symbol)
        @console_int.valid_move_message
        move = @console_int.move_messages(@board.nine_space_array)
      end
      move
    end


    def player_move(num, symbol)
      @console_int.player_turn_message(num)
      move = @console_int.move_messages(@board.nine_space_array)
      move = valid_move_loop(move, symbol)
      @board.fill(move, symbol)
    end

    def tied_or_won_message
     if @eval_game.tied?(@board.nine_space_array)
       @console_int.tied_message
      else
        @console_int.won_message(@player_won)
       @console_int.puts_space
      end
    end
      
    def finished_game
     @console_int.display_board(@board.nine_space_array) 
     @console_int.puts_space
     tied_or_won_message
    end
  end
end
