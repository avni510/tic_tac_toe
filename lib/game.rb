module TicTacToe

  class Game 
    
    def initialize(game_turn, marker_loop, end_game, eval_game)
      @game_turn = game_turn
      @marker_loop = marker_loop
      @end_game = end_game
      @eval_game = eval_game
    end

    def run 
      marker1, marker2 =  @marker_loop.marker_selection
      begin 
        board_array = @game_turn.execute(1, marker1)
        break if @eval_game.game_over?(board_array)
        board_array = @game_turn.execute(2, marker2)
      end while not @eval_game.game_over?(board_array)
      game_result = @eval_game.player_won_or_tied(board_array, marker1, marker2)
      @end_game.finished_game(game_result, board_array)
    end
  end
end
