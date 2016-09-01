#!/usr/bin/env ruby
require_relative "../lib/tic_tac_toe"
validation = TicTacToe::Validation.new

game_eval = TicTacToe::GameEval.new

wrapper = TicTacToe::WrapperIO.new

console_ui = TicTacToe::ConsoleUI.new(wrapper)

marker_loop = TicTacToe::MarkerLoop.new(validation, console_ui)

game_completion = TicTacToe::GameCompletion.new(console_ui, game_eval)

console_runner = TicTacToe::ConsoleRunner.new(marker_loop, game_completion, console_ui)

console_runner.run
