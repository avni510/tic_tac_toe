module TicTacToe
  require 'spec_helper'

  describe Game do 

    before(:all) do
      @p1_marker, @p2_marker = 'X', 'O'

      mock_console_ui = double
      game_eval = GameEval.new
      player_setup = PlayerSetup.new
      @game_type = double

      @game = Game.new(game_eval, player_setup, mock_console_ui, @game_type)
      @player1, @player2  = double, double
    end

    it "sets up the players of the game" do

      allow(@game_type).to receive(:human_v_human).and_return(false)

      allow(@game_type).to receive(:human_v_simp_comp).and_return(true)

      allow_any_instance_of(PlayerSetup).to receive(:p1).and_return(@player1)

      allow_any_instance_of(PlayerSetup).to receive(:p2).and_return(@player2)

      @game.assign_players(@p1_marker, @p2_marker)
    end

    context "player 'O' wins the game" do
      def create_board(spaces)
        board = Board.new
        spaces.each_with_index do |marker, index|
          board.fill(index, marker)
        end
        board
      end

      it "executes each player's turn until the game is over" do
        initial_board = create_board(
          [ 
            "X", "O", "X",
            "3", "O", "X", 
            "6", "7", "8",
          ])

        board_after_player1_move = create_board(
          [ 
            "X", "O", "X",
            "3", "O", "X", 
            "X", "7", "8"
          ])

        allow(@player1).to receive(:make_move).with(initial_board).and_return(board_after_player1_move)

        allow(@player1).to receive(:marker).and_return(@p1_marker).exactly(2).times

        allow(@player2).to receive(:marker).and_return(@p2_marker).exactly(2).times

        board_after_player2_move = create_board(
          [ 
            "X", "O", "X",
            "3", "O", "X", 
            "X", "O", "8"
          ])

        allow(@player2).to receive(:make_move).with(board_after_player1_move).and_return(board_after_player2_move)

        result = @game.players_turns(initial_board)

        expect(result).to eq(board_after_player2_move.nine_space_array)
      end
    end
  end
end
