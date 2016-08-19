require_relative "../spec_helper.rb"

module TicTacToe
  describe Player do
    it "should be initialized with name and X or O" do
      expect {Player.new("Kevin")}.to raise_error(ArgumentError)
      expect {Player.new("Kevin", "invalid")}.to raise_error(RuntimeError, "Invalid team. Choose X's or O's")
      player = Player.new("Kevin", "x")
      expect(player.name).to eq("Kevin")
      expect(player.team).to eq("X")
      expect(player.wins).to eq(0)
    end
    it "should increment wins properly" do
      player = Player.new("Kevin","x")
      player.increment_wins
      expect(player.wins).to eq(1)
    end
  end
end