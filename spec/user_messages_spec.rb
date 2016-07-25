require "user_messages"

describe UserMessages do

  let(:mockio) { double() }
  let(:user_messages) { UserMessages.new(mockio) }

  context "the user enters either an X or an O" do 
    it "prompts the user to select their symbol" do 
      expect(mockio).to receive(:puts_string).exactly(2).times
      expect(mockio).to receive(:get_action).and_return("X")
      user_messages.select_symbol
    end
  end

  context "the user does not enter either an X or an O" do 
    it "prompts the user to select their symbol again" do 
      expect(mockio).to receive(:puts_string).exactly(3).times
      expect(mockio).to receive(:get_action).and_return("8", "O")
      user_messages.select_symbol
    end
  end

  context "player 1 selects and 'X' " do 
    it "returns the correct symbol for player 2 " do 
      expect(mockio).to receive(:puts_string).exactly(2).times
      expect(mockio).to receive(:get_action).and_return("X")
      user_messages.select_symbol
      expect(user_messages.player2_symbol).to eq("O")
    end
  end

  it "can display the current state of the board" do 
    expect(mockio).to receive(:puts_string).exactly(1).times
    board = ["X", "1", "2", "3", "X", "5", "6", "7", "8"]
    user_messages.display_board(board)
  end

  it "prompts the user for their move" do 
   # expect(mockio).to receive(:puts_string).exactly(1).times
    expect(mockio).to receive(:get_action).and_return("2")
    board = ["X", "1", "2", "3", "X", "5", "6", "7", "8"]
    user_messages.player_move(board)
  end

end
