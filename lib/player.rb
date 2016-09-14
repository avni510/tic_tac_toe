module TicTacToe
  class Player
    attr_reader :player_marker

    def initialize(params)
      @player_marker = params[:player_marker]
      @console_ui = params[:console_ui]
      @validation = params.fetch("validation", Validation.new)
    end
  end
end
