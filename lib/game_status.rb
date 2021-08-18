require 'pry'

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  #top row win 
  [3,4,5],  #middle row win 
  [6,7,8],  #bottom row win 
  [0,3,6],  #left column  win 
  [1,4,7],  #middle column  win 
  [2,5,8],  #right column  win 
  [0,4,8],  #left diangle  win 
  [2,4, 6]  #right diangle  win 
]

#for each win_combation in WIN_COMBINATION 
#win_combination is a winning combo from WIN_COMBINATION
#grab each index from win_combination
def won?(board)
  WIN_COMBINATIONS.each do | win_combination |
    win_index_1 = win_combination [0]
    win_index_2 = win_combination [1]
    win_index_3 = win_combination [2]

    position_1 = board[win_index_1] #load the value of the board at win_index_1
    position_2 = board[win_index_2] #load the value of the board at win_index_2
    position_3 = board[win_index_3] #load the value of the board at win_index_3

    if position_1 == position_2 &&  position_2 == position_3  && position_taken?(board, win_index_1)
      return win_combination #return the win_combination indexes that won
    end
  end
  return false
end


def full?(board)
  board.all? {|token| token == "X" || token == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end 

def winner(board)
  if won?(board) != false 
     winning_combo = won?(board)
     board[winning_combo.first]
  end
end

# def draw?(board)
#   # if won?(board) == false && full?(board) == false
#   #   false
#   # elsif won?(board) == true 
#   #   false 
#   # elsif won?(board) == false && full?(board) == true 
#   #     true 
#   # end
# end






