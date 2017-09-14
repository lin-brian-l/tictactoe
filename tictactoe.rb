def create_board
  board = Array.new(3, Array.new(3, " "))
end

def create_pretty_board(board)
  pretty_board = ""
  board.each_with_index do |row, index|
  	if index != 2
  	  pretty_board += "-------------\n"
  	  pretty_board += "#{add_pretty_board_row(row)}\n"
  	else
  	  pretty_board += "-------------\n"
  	  pretty_board += "#{add_pretty_board_row(row)}\n"
  	  pretty_board += "-------------"
  	end
  end
  pretty_board
end

def add_pretty_board_row(board_row)
  pretty_row = ""
  board_row.each_with_index do |box, index|
  	if index != 2
  	  pretty_row += "| #{box} "
  	else
  	  pretty_row += "| #{box} |"
  	end
  end
  pretty_row
end	