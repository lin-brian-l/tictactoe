require_relative '../tictactoe'

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