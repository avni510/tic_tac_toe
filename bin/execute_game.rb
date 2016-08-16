#!/usr/bin/env ruby
require_relative "../lib/tic_tac_toe"

board = TicTacToe::Board.new 

wrapper = TicTacToe::WrapperIO.new

consoleui = TicTacToe::ConsoleUI.new(wrapper)

eval_game = TicTacToe::EvalGame.new

validation = TicTacToe::Validation.new

game_turn = TicTacToe::GameTurn.new(board, consoleui , eval_game, validation)

symbol_loop = TicTacToe::MarkerLoop.new(validation, consoleui)
 
end_game = TicTacToe::EndGame.new(consoleui)

game = TicTacToe::Game.new(game_turn, symbol_loop, end_game)

game.run
