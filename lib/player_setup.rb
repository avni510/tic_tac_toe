module TicTacToe
  class PlayerSetup 
    attr_reader :p1
    attr_reader :p2

    def player_assignment(marker1, marker2, args)
      @p1 = Human.new(marker1, args)
      @p2 = Human.new(marker2, args)
    end
  end
end
