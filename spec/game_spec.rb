module TicTacToe
  require "game"

  describe Game do 

    let(:mock_game_loop) { double () }
    let(:mock_symbol_loop) { double () } 
    let(:mock_end_game) { double () } 
    let(:mock_interface) { double () } 
    let(:game) { Game.new(mock_game_loop, mock_symbol_loop, mock_end_game, mock_interface) }

    describe ".run" do 
      it "can run through an entire tic tac toe game" do 
        expect(mock_symbol_loop).to receive(:symbol_selection)
        game.run
      end
    end
  end
end
