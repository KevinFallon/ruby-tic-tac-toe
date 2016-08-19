module TicTacToe
  class Player
    attr_accessor :name, :team, :wins
    def initialize(name, team)
      team.upcase!
      @name = name
      if team.match("^[XO]$")
        @team = team.upcase
      else
        raise "Invalid team. Choose X's or O's"
      end
      @wins = 0
    end

    def increment_wins
      @wins += 1
    end
  end
end