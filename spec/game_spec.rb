module TicTacToe
  require "game"

  describe Game do 

    let(:mock_game_loop) { double () }
    let(:mock_symbol_loop) { double () } 
    let(:mock_end_game) { double () } 
    let(:game) { Game.new(mock_game_loop, mock_symbol_loop, mock_end_game) }

    describe ".run" do 
      it "can run through an entire tic tac toe game" do 
        expect(mock_symbol_loop).to receive(:symbol_selection)

        expect(mock_symbol_loop).to receive(:player1_symbol).and_return("O")
        expect(mock_symbol_loop).to receive(:player2_symbol).and_return("X")
        expect(mock_game_loop).to receive(:instructions).with(nil, "O", "X").and_return(nil)

        expect(mock_symbol_loop).to receive(:player1_symbol).and_return("O")
        expect(mock_symbol_loop).to receive(:player2_symbol).and_return("X")
        expect(mock_game_loop).to receive(:instructions).with(nil, "O", "X").and_return("2")

        expect(mock_end_game).to receive(:finished_game).with("2")

        game.run
      end
    end
  end
end
