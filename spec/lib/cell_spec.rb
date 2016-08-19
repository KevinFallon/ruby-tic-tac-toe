require_relative "../spec_helper.rb"

module TicTacToe

	describe Cell do
		it "should have valid value" do
			cell = Cell.new
			expect(cell.value.upcase).to match("[-XO]")
		end

		it "can update its value" do
			cell = Cell.new
			cell.update("x")
			expect(cell.value).to eq("X")
		end

    it "should not change from X or O" do
      cell = Cell.new
      cell.update("X")
      cell.update("O")
      expect(cell.value).to eq("X")
    end
	end
end