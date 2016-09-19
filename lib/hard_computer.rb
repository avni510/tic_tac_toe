module TicTacToe
  class HardComputer < Computer

    MAX_OPEN_SPACES = 9

    def generate_move(board, depth = 0, scores = {},current_marker = nil)
      @board = board

      open_spaces_in_board = available_spaces

      move = random_first_move(open_spaces_in_board) 

      return move unless move ==  nil
      
      if @game_eval.game_over?(@board.cells, @player_marker, @opponent_marker)
        return score
      end

      open_spaces_in_board.each do |space|
        current_marker = marker_to_fill_board(depth)
        @board.fill(space, current_marker)
        scores[space] = generate_move(@board, depth + 1)
        @board.refill(space)
      end
      
      @best_move, best_score = calculate_move_and_score(current_marker, scores)

      depth == 0 ? @best_move : best_score 
    end

    private

    def random_first_move(open_spaces)
      if open_spaces.length ==  MAX_OPEN_SPACES
        return ["0", "2", "6", "8"].shuffle.first
      end
    end

    def marker_to_fill_board(depth)
      depth % 2 == 0 ? @player_marker : @opponent_marker
    end

    def available_spaces
      open_spaces_in_board = []
      @board.cells.each do |space|
        if @validation.valid_position?(space)
          open_spaces_in_board << space 
        end
      end
      open_spaces_in_board
    end

    def score
      game_tied = @game_eval.tied?(@board.cells, @player_marker, @opponent_marker)
      game_won = @game_eval.won?(@board.cells, @player_marker, @opponent_marker)
      winning_marker = @game_eval.winning_player_marker(@board.cells, @player_marker, @opponent_marker)
      if game_won
        winning_marker == @player_marker ? 1 : -1
      elsif game_tied 
        return 0
      end
    end

    def calculate_move_and_score(current_marker,scores)
      if current_marker == @player_marker
        scores.max_by { |_, val| val }
      else
        scores.min_by { |_, val| val }
      end
    end
  end
end
