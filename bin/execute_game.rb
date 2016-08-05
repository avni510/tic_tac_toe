#!/usr/bin/env ruby
require_relative "../lib/tic_tac_toe"

game = TicTacToe::Game.new(
TicTacToe::GameLoop.new(TicTacToe::Board.new, TicTacToe::ConsoleInterface.new(TicTacToe::WrapperIO.new), TicTacToe::EvalGame.new, TicTacToe::Validation.new),
TicTacToe::SymbolLoop.new(TicTacToe::Validation.new, TicTacToe::ConsoleInterface.new(TicTacToe::WrapperIO.new)),

TicTacToe::EndGame.new(TicTacToe::ConsoleInterface.new(TicTacToe::WrapperIO.new)))

game.run
