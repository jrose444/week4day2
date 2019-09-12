# require_relative './piece'
require_relative './pawn.rb'
require_relative './rook.rb'
require_relative './knight.rb'
require_relative './bishop.rb'
require_relative './king.rb'
require_relative './queen.rb'
require_relative './null_piece'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) {Array.new(8, NullPiece.instance)}
    @sentinel = NullPiece.instance
    fill_board
  end

  def place_pawns
    (0..7).each do |i|
      @grid[1][i] = Pawn.new('pawn', :w, self)
      @grid[6][i] = Pawn.new('pawn', :b, self)
    end
  end

  def place_rooks
    @grid[0][0] = Rook.new('rook', :w, self)
    @grid[0][7] = Rook.new('rook', :w, self)
    @grid[7][0] = Rook.new('rook', :b, self)
    @grid[7][7] = Rook.new('rook', :b, self)
  end

  def place_knights
    @grid[0][1] = Knight.new('knight', :w, self)
    @grid[0][6] = Knight.new('knight', :w, self)
    @grid[7][1] = Knight.new('knight', :b, self)
    @grid[7][6] = Knight.new('knight', :b, self)
  end

  def place_bishops
    @grid[0][2] = Bishop.new('bishop', :w, self)
    @grid[0][5] = Bishop.new('bishop', :w, self)
    @grid[7][2] = Bishop.new('bishop', :b, self)
    @grid[7][5] = Bishop.new('bishop', :b, self)
  end

  def place_royalty
    @grid[0][3] = King.new('king', :w, self)
    @grid[0][4] = Queen.new('queen', :w, self)
    @grid[7][3] = King.new('king', :b, self)
    @grid[7][4] = Queen.new('queen', :b, self)
  end

  def fill_board
    place_pawns
    place_rooks
    place_knights
    place_bishops
    place_royalty
  end

  # def fill_board
  #   i = 0
  #   while i < @grid.length
  #     @grid[i].each_with_index do |position, idx|
  #       if i == 0 || i == 1 || i == 6 || i == 7
  #         @grid[i][idx] = Piece.new
  #       else
  #         @grid[i][idx] = NullPiece.instance
  #       end
  #     end
  #     i += 1
      
  #   end
  # end

  def move_piece(start_position, end_position)
    x,y = start_position
    a,b = end_position

    begin
      raise "invalid start position"if self.on_the_board?(start_position) == false
      raise "invalid end position" if self.on_the_board?(end_position) == false
      raise 'this spot is empty' if @grid[x][y].is_a?(NullPiece)
      raise 'there is something here!' if !@grid[a][b].is_a?(NullPiece)
      
      grid[x][y], grid[a][b] = grid[a][b], grid[x][y]
      
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