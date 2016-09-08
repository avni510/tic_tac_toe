module TicTacToe
  class PlayerSetup 
    attr_reader :player1
    attr_reader :player2

    def player_assignment(marker1, marker2, args)
      @player1 = Human.new(marker1, args)
      @player2 = Human.new(marker2, args)
    end
  end
end
