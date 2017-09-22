board = Array.new(3, Array.new(3, " "))
# blank = [" ", " ", " "]
# board = []
# board << blank
# board << blank
# board << blank
# def create_pretty_board(board)
#   pretty_board = ""
#   board.each_with_index do |row, index|
#     if index != 2
#       pretty_board += "-------------\n"
#       pretty_board += "#{add_pretty_board_row(row)}\n"
#     else
#       pretty_board += "-------------\n"
#       pretty_board += "#{add_pretty_board_row(row)}\n"
#       pretty_board += "-------------"
#     end
#   end
#   pretty_board
# end

# def add_pretty_board_row(board_row)
#   pretty_row = ""
#   board_row.each_with_index do |box, index|
#     if index != 2
#       pretty_row += "| #{box} "
#     else
#       pretty_row += "| #{box} |"
#     end
#   end
#   pretty_row
# end

def x_or_o_in_board(board, user_input, coordinates = [nil, nil])
  row_index = coordinates[0]
  column_index = coordinates[1]
  row = board[row_index].dup
  row[column_index] = user_input
  board[row_index] = row
  # board[0][column_index] = user_input
  board
end

coordinates = [1,1]
# p board
# test = board[0][0].dup
# p test
# test = "X"
# board[0][0] = test
# p board
# board[0][0] = "X"
x_or_o_in_board(board, "O", coordinates)
p board
# p test = board[0].dup
# p "--------------"
# p test[0] = "X"
# p "_______________"
# p "000000000"
# p board[1]
# p "----------"

# p board[0] = test
# p "111111"
# p board[1]
# p "2222222"
# p board[2]
# p board

# pretty_board = create_pretty_board(board)
# puts pretty_board
