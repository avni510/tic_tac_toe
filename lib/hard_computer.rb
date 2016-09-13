require 'pry'
module TicTacToe
  class HardComputer < Player

    def make_move(board)
      @board = board
      @console_ui.move_messages(@board.cells, @marker)
      move = minmax(board)
      binding.pry
      @console_ui.computer_move_message(move)
      @board.fill(move, @marker)
    end

    def minmax(board, depth = 0)
      game_eval = GameEval.new
      if @marker = 'X'
        @opponent_marker = 'O'
      else
        @opponent_marker = 'X'
      end
      return score(board) if game_eval.game_over?(board.cells, @marker, @opponent_marker)
      score = {}
      board.cells.each do |space|
        if not space !~ /^[0-8]{1}$/
          next_board_state = board.dup
          if depth % 2 == 0
            marker_to_fill_board = @marker
          else
            marker_to_fill_board = @opponent
          end

          next_board_state.fill(space, marker_to_fill_board)

          scores[space] = minmax(next_board_state, depth + 1 )
        end
      end
      best_choice = best_move(marker_to_fill_board, scores)
    end

    def score(board)
      if eval_game.won?(board)
        if winning_player_marker(board, @marker, @opponent_marker) == @marker
          return 10
        else
          return -10
        end
      else eval_game.tied(board, @marker, @opponent_marker)
        return 0
      end        
    end

    def best_move(marker_to_fill_board, scores)
      if marker_to_fill_board == @marker
        scores.max_by { |_,v| v }[0]
      else
        scores.min_by { |_,v| v }[0]
      end
    end
  end
end

