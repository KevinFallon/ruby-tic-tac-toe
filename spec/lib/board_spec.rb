require_relative "../spec_helper.rb"

module TicTacToe

  describe Board do
    it "initialzie to 3 by 3 with '-'' as cell values" do
      passes = true
      count = 0
      board = Board.new
      3.times do |row|
        3.times do |col|
          passes = false unless board.get_cell_value(row, col) == "-"
          count += 1
        end
      end
      board.print_board
      expect(passes).to be true
      expect(count).to eq(9)
    end

    it "should change be able to change it's cells' values" do
      board = Board.new
      board.update_cell_value(1,1, "x")
      expect(board.get_cell_value(1,1)).to eq("X")
    end

    it "should raise error on incorrect move" do
      board = Board.new
      expect{board.update_cell_value(1,1, "wrong")}.to raise_error(RuntimeError, "Incorrect move!")
    end

    it "should recognize its full" do
      count = 0
      board = Board.new
      board.cells.length.times do |row|
        board.cells[row].length.times do |col|
          if count % 2 == 0
            board.update_cell_value(row,col,"X")
          else
            board.update_cell_value(row,col,"O")
          end
          count += 1
        end
      end
      expect(board.check_winner).to be_nil
      expect(board.is_full?).to be true
    end

    it "should recognize a winning row" do
      board = Board.new
      board.update_cell_value(0,0, "x")
      board.update_cell_value(0,1, "X")
      board.update_cell_value(0,2, "x")
      expect(board.check_winner).to eq(:X)
    end

    it "should recognize a winning row" do
      board = Board.new
      board.update_cell_value(0,0, "O")
      board.update_cell_value(1, 0, "O")
      board.update_cell_value(2, 0, "O")
      expect(board.check_winner).to eq(:O)
    end

    it "should recognize winning diagonal" do
      board = Board.new
      board.update_cell_value(2,2, "X")
      board.update_cell_value(1,1, "X")
      board.update_cell_value(0,0, "X")
      expect(board.check_winner).to eq(:X)
    end
  end
end