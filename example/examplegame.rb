require_relative "../lib/tic_tac_toe.rb"

player1 = TicTacToe::Player.new("Kevin", "X")
player2 = TicTacToe::Player.new("Bailey", "O")
players = [player1, player2]
puts TicTacToe::Game.new(players).play