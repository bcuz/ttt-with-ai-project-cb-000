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
    # can maybe make more concise
    count = 0
    @cells.each do |item|
      if item == "X" or item == 'O'
      count += 1
      end
    end

    count

  end

end
