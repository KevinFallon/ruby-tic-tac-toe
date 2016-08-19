module TicTacToe
  class Board

    attr_reader :cells

    def initialize
      @cells = Array.new(3) { Array.new(3) { Cell.new } }
    end

    def update_cell_value(row, col, value)
      result = @cells[row][col].update(value)
      raise RuntimeError, "Incorrect move!" unless result
    end

    def get_cell_value(row, col)
      @cells[row][col].value
    end

    def is_full?
      is_full = true
      @cells.length.times do |row|
        @cells[row].length.times do |col|
           if @cells[row][col].value == "-"
            is_full = false
          end
        end
      end
      is_full
    end

    def print_board
      @cells.length.times do |row|
        @cells[row].length.times do |col|
          print @cells[row][col].value
        end
        puts
      end
    end

    def check_winner
      winner = nil
      #check horizontals
      @cells.each do |row|
        winner ||= check_arr_for_winner(row)
      end
      #check columns
      @cells.transpose.each do |col|
        winner ||= check_arr_for_winner(col)
      end
      #check diagonals
      winner ||= check_arr_for_winner( [@cells[0][0], @cells[1][1], @cells[2][2]] ) 
      winner ||= check_arr_for_winner( [@cells[2][0], @cells[1][1], @cells[0][2]] )
      winner
    end

    def reset
      @cells.length.times do |row|
        @cells[row].length.times do |col|
          @cells[row][col].reset
        end
      end
    end

    private 
    def check_arr_for_winner(arr)
      x_count = 0
      o_count = 0
      arr.each do |elem|
        if elem.value == "X"
          x_count+=1
        elsif elem.value == "O"
          o_count+=1
        end
      end
      x_count == 3? :X : o_count == 3? :O : nil
    end


  end
end