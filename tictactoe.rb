require 'remedy'
include Remedy

def check_input(key, coordinate)
  valid_input = ["up", "down", "left", "right"]
  valid_range = (0..2).to_a

  if !valid_input.include?(key.to_s)
    puts "nope"
  else
    if key.to_s == "down" && valid_range.include?(coordinate[0]+1)
      coordinate[0] += 1
      p coordinate
    elsif key.to_s == "up" && valid_range.include?(coordinate[0]-1)
      coordinate[0] -= 1
      p coordinate
    elsif key.to_s == "left" && valid_range.include?(coordinate[1]-1)
      coordinate[1] -= 1
      p coordinate
    elsif key.to_s == "right" && valid_range.include?(coordinate[1]+1)
      coordinate[1] += 1
      p coordinate
    else
      puts "you done f'd up"
    end
  end
end

def loop_user_input
  coordinate = [0,0]
  taken_coordinates = []
  user_input = Interaction.new
  user_input.loop do |key|
    puts key
    check_input(key, coordinate)
  end
end

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

def x_or_o_in_board_v1(board, user_input, coordinates = [nil, nil])
  row_index = coordinates[0]
  column_index = coordinates[1]
  board[row_index][column_index] = user_input
  board
end

def x_or_o_in_board_v2(board, user_input, coordinates = [nil, nil])
  row_index = coordinates[0]
  column_index = coordinates[1]
  row = board[row_index].dup
  row[column_index] = user_input
  board[row_index] = row
  board
end

def board_win?(board)
  return true if row_win?(board) || column_win?(board) || diagonal_win?(board)
  false
end

def row_win?(board)
  board.each { |row| return true if row == ["X", "X", "X"] || row == ["O", "O", "O"] }
  false
end

def column_win?(board)
  column = board.transpose.each { |column| return true if column == ["X", "X", "X"] || column == ["O", "O", "O"] }
  false
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
