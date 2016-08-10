#!/usr/bin/env ruby
require_relative "../lib/tic_tac_toe"

board = TicTacToe::Board.new 

wrapper = TicTacToe::WrapperIO.new

consoleui = TicTacToe::ConsoleInterface.new(wrapper)

eval_game = TicTacToe::EvalGame.new

validation = TicTacToe::Validation.new

game_loop = TicTacToe::GameLoop.new(board, consoleui , eval_game, validation)

symbol_loop = TicTacToe::SymbolLoop.new(validation, consoleui)
 
end_game = TicTacToe::EndGame.new(consoleui)

game = TicTacToe::Game.new(game_loop, symbol_loop, end_game)

game.run
