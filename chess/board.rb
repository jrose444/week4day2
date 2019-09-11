require_relative './piece'

class Board
  attr_reader :grid

  def self.create_board
    Board.new.fill_board
  end

  def initialize
    @grid = Array.new(8) {Array.new(8)}
  end

  def fill_board
    i = 0
    while i < @grid.length
      @grid[i].each_with_index do |position, idx|
        if i == 0 || i == 1 || i == 6 || i == 7
          @grid[i][idx] = Piece.new
        else
          @grid[i][idx] = NullPiece.new
        end
      end
      i += 1
    end
  end

  def move_piece(start_position, end_position)
    x,y = start_position
    a,b = end_position

    begin
      raise "errorrrrrrrrrrrrr"if self.on_the_board?(start_position) == false
      raise "errrrrrrooooooorrrrrrr" if self.on_the_board?(end_position) == false
      @grid[x][y].is_a?(NullPiece)
      
    # rescue => exception
      
    end

  end
  
  def on_the_board?(position)
    x, y = position
    if x > 7 || x < 0|| y > 7 || y < 0
      return false
    else
      return true
    end
  end

end