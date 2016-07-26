require "console_interface"

describe ConsoleInterface do 
  let(:mockio) { double() }
  let(:console_int) { ConsoleInterface.new(mockio) }

  context "the user enters either an X or an O" do 
    it "prompts the user to select their symbol" do 
      expect(mockio).to receive(:puts_string).exactly(1).times
      expect(mockio).to receive(:get_action).and_return("X")
      console_int.select_symbol
    end
  end

  context "the user does not enter either an X or an O" do 
    it "prompts the user to select their symbol again" do 
      expect(mockio).to receive(:puts_string).exactly(2).times
      expect(mockio).to receive(:get_action).and_return("8", "O")
      console_int.select_symbol
    end
  end

  context "player 1 selects and 'X' " do 
    it "returns the correct symbol for player 2 " do 
      expect(mockio).to receive(:puts_string).exactly(1).times
      expect(mockio).to receive(:get_action).and_return("X")
      console_int.select_symbol
      expect(console_int.player2_symbol).to eq("O")
    end
  end

	it "can display each player's symbols" do 
		expect(mockio).to receive(:puts_string).exactly(1).times
		console_int.puts_symbols
	end

  it "can display the current state of the board" do 
    expect(mockio).to receive(:puts_string).exactly(1).times
		board = ["0", "1", "2", "X", "O", "5", "O", "7", "8"]
    console_int.display_board(board)
  end

	it "can prints a game over message" do 
		expect(mockio).to receive(:puts_string).exactly(1).times
		console_int.game_over_message	
	end

	it "prompts the user for their move on the board" do 
 			expect(mockio).to receive(:puts_string).exactly(1).times
 			expect(mockio).to receive(:get_action).and_return("1")
			expect(console_int.player_move).to eq("1")
	end 
 	
end
