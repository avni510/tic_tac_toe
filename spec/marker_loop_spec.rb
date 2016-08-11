module TicTacToe
  require "marker_loop"
  require "validation"
  
  describe MarkerLoop do 
    let(:mock_console_ui) { double () } 
    let(:validation) { Validation.new }
    let(:marker_loop) { marker_loop = MarkerLoop.new(validation, mock_console_ui) }

    before(:each) do 
      allow(mock_console_ui).to receive(:select_marker_message)
      allow(mock_console_ui).to receive(:user_input)
      allow(mock_console_ui).to receive(:puts_markers)
      allow(mock_console_ui).to receive(:puts_space)
    end

    describe ".marker_selection" do 
      it "prompts the user to select a marker" do 
        expect(mock_console_ui).to receive(:select_marker_message)
        
        expect(mock_console_ui).to receive(:user_input).and_return("X")

        marker_loop.marker_selection
      end

      context "Player 1 chooses 'O'" do 
        
        before(:each) do 
          expect(mock_console_ui).to receive(:user_input).and_return("O")
        end 

        it "returns 'X' for Player 2" do 
          result = marker_loop.marker_selection
          expect(result).to eq(["O", "X"])
        end

        it "displays the markers of each player" do 
          expect(mock_console_ui).to receive(:puts_markers).with("O", "X")

          marker_loop.marker_selection
        end

        it "returns uppercase markers" do
          allow(mock_console_ui).to receive(:user_input).and_return("o")

          result = marker_loop.marker_selection
          expect(result).to eq(["O", "X"])
        end
      
      end

      context "the player enters an invalid marker" do 
        it "prompts to the user to enter another marker" do 
          expect(mock_console_ui).to receive(:user_input).and_return('p', 'X')
          
          expect(validation).to receive(:marker_conditions?).with('p').and_return(false)
          
          expect(mock_console_ui).to receive(:valid_marker_message)

          expect(validation).to receive(:marker_conditions?).with('X').and_return(true)
          marker_loop.marker_selection
        end
      end
    end
  end
end
