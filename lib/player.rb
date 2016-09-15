module TicTacToe
  class Player
    attr_reader :player_marker
    attr_reader :opponent_marker
    attr_reader :game_eval

    def initialize(params)
      @player_marker = params[:player_marker]
      @console_ui = params[:console_ui]
      @validation = params.fetch("validation", Validation.new)
      @ai = params[:ai]
      @opponent_marker = params[:opponent_marker]
      @game_eval = params[:game_eval]
    end
  end
end
