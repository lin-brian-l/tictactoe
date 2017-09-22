require_relative '../tictactoe'

describe "create_board" do
  it "creates an empty 3x3 array" do
  	expect(create_board).to eq [
  	  [" ", " ", " "],
  	  [" ", " ", " "],
  	  [" ", " ", " "]
  	]
  end
end

describe "add_pretty_board_row" do
  it "prints out a pretty row" do
    board_row = [" ", " ", " "]
    expect(add_pretty_board_row(board_row)).to eq "|   |   |   |"
  end
end

describe "create_pretty_board" do
  it "prints out a pretty board" do
  	board = Array.new(3, Array.new(3, " "))
  	pretty_board = "-------------
|   |   |   |
-------------
|   |   |   |
-------------
|   |   |   |
-------------"
  	expect(create_pretty_board(board)).to eq pretty_board
  end
  it "prints out a board with X's and O's" do
  	board = [
  	  ["X", "O", "X"],
  	  [" ", " ", "O"],
  	  [" ", " ", " "]
  	]
  	pretty_board = "-------------
| X | O | X |
-------------
|   |   | O |
-------------
|   |   |   |
-------------"
	expect(create_pretty_board(board)).to eq pretty_board
  end
end

describe "x_or_o_in_board_v1" do
  it "substitutes an X or O in the proper spot of a small board" do
  	board = [[" ", " ", " "]]
  	user_input = "X"
  	coordinates = [0, 2]

  	expect(x_or_o_in_board_v1(board, user_input, coordinates)).to eq [[" ", " ", "X"]]
  end

  it "puts an X or O on a blank board" do
    board = create_board
    user_input = "O"
    coordinates = [1,1]

    expect(x_or_o_in_board_v1(board, user_input, coordinates)).to eq [
      [" ", " ", " "],
      [" ", "O", " "],
      [" ", " ", " "]
    ]

  end

  it "substitutes an X or O in the proper spot of a large board" do
  	board = [
  	  ["X", "O", "X"],
  	  [" ", " ", "O"],
  	  [" ", " ", " "]
  	]
  	user_input = "O"
  	coordinates = [1, 1]

  	expect(x_or_o_in_board_v1(board, user_input, coordinates)).to eq [
  	  ["X", "O", "X"],
  	  [" ", "O", "O"],
  	  [" ", " ", " "]
  	]
  end

  it "stores previous turns" do
  	board = [
  	  ["X", "O", "X"],
  	  [" ", " ", "O"],
  	  [" ", " ", " "]
  	]
  	user_input_1 = "O"
  	coordinates_1 = [1, 1]
  	board = x_or_o_in_board_v1(board, user_input_1, coordinates_1)

  	user_input_2 = "X"
  	coordinates_2 = [1, 0]
  	expect(x_or_o_in_board_v1(board, user_input_2, coordinates_2)). to eq [
  	  ["X", "O", "X"],
  	  ["X", "O", "O"],
  	  [" ", " ", " "]
  	]
  end
end

describe "row_win?" do
  it "returns true if a row has 3 X's" do
	board = [
  	  ["X", "X", "X"],
  	  [" ", " ", "O"],
  	  [" ", " ", " "]
  	]
  	expect(row_win?(board)).to eq true
  end

  it "returns true if a row has 3 O's" do
	board = [
  	  ["X", "O", "X"],
  	  ["O", "O", "O"],
  	  [" ", "X", " "]
  	]
  	expect(row_win?(board)).to eq true
  end

  it "returns false if no rows have 3 X's or O's" do
  	board = [
  	  ["X", "O", "X"],
  	  [" ", " ", "O"],
  	  [" ", " ", " "]
  	]
  	expect(row_win?(board)).to eq false
  end
end

describe "column_win?" do
  it "returns false if a column has 3 X's" do
	board = [
  	  ["X", "O", "O"],
  	  ["X", " ", "O"],
  	  ["X", " ", " "]
  	]
  	expect(column_win?(board)).to eq true
  end

  it "returns true if a column has 3 O's" do
	board = [
  	  ["X", "O", "X"],
  	  ["O", "O", "O"],
  	  [" ", "O", "X"]
  	]
  	expect(column_win?(board)).to eq true
  end

  it "returns false if no columns have 3 X's or O's" do
  	board = [
  	  ["X", "O", "X"],
  	  [" ", " ", "O"],
  	  [" ", " ", " "]
  	]
  	expect(column_win?(board)).to eq false
  end
end

describe "xo_ltrt_updn?" do
  it "returns true if X's are in a diagonal from left-right up-down" do
  	board = [
  	  ["X", "O", "X"],
  	  ["O", "X", "O"],
  	  [" ", "O", "X"]
  	]
  	expect(xo_ltrt_updn?(board)).to eq true
  end

  it "returns false if X's are not in a diagonal from left-right up-down" do
	board = [
  	  ["X", "O", "X"],
  	  ["O", "O", "O"],
  	  [" ", "O", "X"]
  	]
  	expect(xo_ltrt_updn?(board)).to eq false
  end

  it "returns true if O's are in a diagonal from left-right up-down" do
      board = [
		["O", "O", "X"],
		["O", "O", "O"],
		[" ", "O", "O"]
      ]
      expect(xo_ltrt_updn?(board)).to eq true
  end

  it "returns false if O's are not in a diagonal from left-right up-down" do
	board = [
  	  ["X", "O", "X"],
  	  ["O", "O", "O"],
  	  [" ", "O", "X"]
  	]
  	expect(xo_ltrt_updn?(board)).to eq false
  end

end

describe "xo_rtlt_dnup?" do
  it "returns true if X's are in a diagonal from right-left down-up" do
  	board = [
  	  ["X", "O", "X"],
  	  ["O", "X", "O"],
  	  ["X", "O", "X"]
  	]
  	expect(xo_rtlt_dnup?(board)).to eq true
  end

  it "returns false if X's are not in a diagonal from right-left down-up" do
	board = [
  	  ["X", "O", "X"],
  	  ["O", "O", "O"],
  	  [" ", "O", "X"]
  	]
  	expect(xo_rtlt_dnup?(board)).to eq false
  end

  it "returns true if O's are in a diagonal from right-left down-up" do
  	board = [
  	  ["X", "O", "O"],
  	  ["O", "O", "O"],
  	  ["O", "O", "O"]
  	]
  	expect(xo_rtlt_dnup?(board)).to eq true
  end

  it "returns false if O's are not in a diagonal from right-left down-up" do
	board = [
  	  ["X", "O", "X"],
  	  ["O", "O", "O"],
  	  [" ", "O", "X"]
  	]
  	expect(xo_rtlt_dnup?(board)).to eq false
  end
end

describe "diagonal_win?" do
  it "returns true if O's or X's on a diagonal" do
	board = [
  	  ["X", "O", "O"],
  	  ["O", "O", "O"],
  	  ["O", "O", "O"]
  	]
  	expect(diagonal_win?(board)).to eq true
  end

  it "returns false if X's or O's are not in a diagonal" do
	board = [
  	  ["X", "O", "X"],
  	  ["O", "O", "O"],
  	  [" ", "O", "X"]
  	]
  	expect(diagonal_win?(board)).to eq false
  end
end

describe "board_win?" do
  it "returns true if a row has 3 X's or O's" do
  	board = [
  	  ["X", "O", "X"],
  	  ["O", "O", "O"],
  	  [" ", "X", " "]
  	]
  	expect(board_win?(board)).to eq true
  end

  it "returns true if a column has 3 O's" do
	board = [
  	  ["X", "O", "X"],
  	  ["O", "O", "O"],
  	  [" ", "O", "X"]
  	]
  	expect(column_win?(board)).to eq true
  end

  it "returns true if O's or X's on a diagonal" do
	board = [
  	  ["X", "O", "O"],
  	  ["O", "O", "O"],
  	  ["O", "O", "O"]
  	]
  	expect(diagonal_win?(board)).to eq true
  end

  it "returns false if no win conditions are met" do
  	board = [
  	  ["X", "O", "X"],
  	  [" ", " ", "O"],
  	  [" ", " ", " "]
  	]
  	expect(column_win?(board)).to eq false
  end
end

