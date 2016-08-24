#!/usr/bin/env ruby
require_relative "../lib/tic_tac_toe"

board = TicTacToe::Board.new 

wrapper = TicTacToe::WrapperIO.new

consoleui = TicTacToe::ConsoleUI.new(wrapper)

game_eval = TicTacToe::GameEval.new

validation = TicTacToe::Validation.new

params = 
  { :board => board,
    :validation => validation, 
    :console_ui => consoleui}
    
game_turn = TicTacToe::GameTurn.new(params)

symbol_loop = TicTacToe::MarkerLoop.new(validation, consoleui)
 
game_completion = TicTacToe::GameCompletion.new(consoleui)

game = TicTacToe::Game.new(game_turn, symbol_loop, game_completion, game_eval)

game.run
