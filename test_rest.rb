board = Array.new(3, Array.new(3, " "))

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
  # row_index = coordinates[0]
  column_index = coordinates[1]
  board[0][column_index] = user_input
  board
end

coordinates = [0,0]
p board
x_or_o_in_board(board, "O", coordinates)
p board
# pretty_board = create_pretty_board(board)
# puts pretty_board
