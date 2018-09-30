
# array containing all possible winning play combinations
WIN_COMBINATIONS = [
[0,1,2], #row-wins
[3,4,5],
[6,7,8],

[0,3,6], #column-wins
[1,4,7],
[2,5,8],

[0,4,8], #diagonal-wins
[2,4,6]

]

# throws down board spaces and ouput's string into a designed board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#converts user's input into a usable integer
def input_to_index(input)
  index = input.to_i - 1
end

def player_move(board, index, token)
  board[index] = token
end

def position_taken?(board, index)
  board[index] == "X" || board[index] == "O"
end

def valid_move?(board, index)
  !position_taken?(board, index) && index.between?(0, 8)
end


def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
    board.each do |spot|
      if spot != " "
      counter += 1
      end
    end
  return counter
end

#this seems like too many end's are being used
def turn(board)
  puts "Please, select a spot on the board: 1-9"
  input = gets.strip
  index = input_to_index(input)
    if valid_move?(board, index)
      player_move(board, index)
      display_board(board)
      else
      turn(board)
    end
end


def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win|
    if position_taken?(board, win[0]) && board[win[0]] == board[win[1]] && board[win[2]] == board[win[2]]
      return win
    end
  end
 return false
end

def full?(board)
  board.all? { |space| space == "X" || space == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
     combo = won?(board)
     board[combo[0]]
    else
      nil
  end
end

def play(board)
  turn(board) until over?(board)
    if won?(board)
      then print "Congratulations, Winner #{winner(board)}!"
    elsif draw?(board)
      then print "Cat's Game!"
    else
      nil
    end
end
