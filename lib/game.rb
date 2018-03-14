class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  # ETC, an array for each win combination
]

# odd
def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
end

def current_player
  num = @board.turn_count

 if num % 2 == 0
   @player_1
 else
   @player_2
 end
end

def over?
  if @board.full? or won? or draw?
  true
else
  false
end
end

def won?
  x = WIN_COMBINATIONS.select do |combo|
    # p combo
  win_index_1 = combo[0]
  win_index_2 = combo[1]
  win_index_3 = combo[2]

  position_1 = @board.cells[win_index_1] # load the value of the @board at win_index_1
  position_2 = @board.cells[win_index_2] # load the value of the @board at win_index_2
  position_3 = @board.cells[win_index_3] # load the value of the @board at win_index_3

  if position_1 == "X" && position_2 == "X" && position_3 == "X" or
    position_1 == "O" && position_2 == "O" && position_3 == "O"
    #
    return combo # return the win_combination indexes that won.
  end
  end

  if x == []
    return false
  end

  x

end

def draw?
  if @board.full? and !won?
    return true
  else
    return false
  end
end

def winner
  if over? and won?
    combo = won?

    return @board.cells[combo[0]]
  end
end

def turn

  puts "Please enter 1-9:"
  #  input = gets.strip
  input = current_player.move(@board)

  if @board.valid_move?(input)
      @board.update(input, current_player)
      @board.display
  else
    puts 'enter something not taken'
    # input = current_player.move(@board)
  end
end

def play
  while !over?
    turn
  end
  if winner
    puts "Congratulations #{winner}!"

    elsif draw?
      puts "Cat's Game!"
  end
end
end
