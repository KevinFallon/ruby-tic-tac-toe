module TicTacToe
	class Cell
		attr_accessor :value

		def initialize()
			reset
		end

		def update(new_value)
			new_value.upcase!
      if new_value.match "^[XO]$" and @value == "-"
        @value = new_value
        true
      else
        false
      end
		end

    def reset()
      @value = "-"
    end
	end
end