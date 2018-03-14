class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
  if @cells.include?(" ")
    false
  else
    true
  end
end

  def turn_count
    all = @cells.collect do |item|
      if item == "X" or item == 'O'
        item
      end
    end
    all.compact.size
end

def taken?(location)
  @cells[location.to_i - 1] != " "
end

def valid_move?(input)
  input.to_i.between?(1,9) && !taken?(input)

end

def update(input, player)
  if valid_move?(input)
    @cells[input.to_i - 1] = player.token
  end

end

end
