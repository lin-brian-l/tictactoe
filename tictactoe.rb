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

def x_or_o_in_board(board, user_input, coordinates = [nil, nil])
  row_index = coordinates[0]
  column_index = coordinates[1]
  board[row_index][column_index] = user_input
  board
end

def row_win?(board)
  row = board.find_index { |row| row == ["X", "X", "X"] || row == ["O", "O", "O"] }
end

def column_win?(board)
  column = board.transpose.find_index { |column| column == ["X", "X", "X"] || column == ["O", "O", "O"] }
end

def diagonal_win?(board)
  xo_ltrt_updn?(board)
  xo_rtlt_dnup?(board)
end

def xo_ltrt_updn?(board)
  if board[0][0] == "X" || board[0][0] == "O"
  	return true if board[0][0] == board[1][1] && board[0][0] == board[2][2]
  end
  false
end

def xo_rtlt_dnup?(board)
  if board[0][2] == "X" || board[0][2] == "O"
  	return true if board[0][2] == board[1][1] && board[0][2] == board[2][0]
  end
  false
end
