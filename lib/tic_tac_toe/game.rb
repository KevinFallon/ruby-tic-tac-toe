module TicTacToe
  class Game

    def initialize(players, board = Board.new)
      raise "Player's can't be on the same team" if players[0].team == players[1].team
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end

    def play
      while true do
        valid_move = false
        while !valid_move do
          begin
            x_coord, y_coord = get_player_move
            @board.update_cell_value(x_coord, y_coord, @current_player.team)
            valid_move = true
          rescue RuntimeError => e
            puts "A player has already placed something in this coordinate!"
            @board.print_board
          end
        end
        @board.print_board
        switch_current_player
        winner = @board.check_winner
        if winner != nil
          puts "#{get_winner_name(winner)} has won!"
          break
        elsif @board.is_full?
          puts "The game ended in a draw!"
          break
        end
      end
    end

    private
    def get_player_move
      puts "#{@current_player.name}, enter coordinates separated by a comma to play a(n) #{@current_player.team}"
      x,y = gets.chomp.split(",")
      x = x.to_i
      y = y.to_i
      return x,y
    end

    def switch_current_player
      @current_player, @other_player = @other_player, @current_player
    end

    def get_winner_name(team)
      @current_player.name if @current_player.team == team
      @other_player.name
    end

  end
end