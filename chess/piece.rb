# require_relative './slideable_module.rb'
# require_relative './pawn.rb'
# require_relative './rook.rb'
# require_relative './knight.rb'
# require_relative './bishop.rb'
# require_relative './king.rb'
# require_relative './queen.rb'
require_relative './slideable_module'
class Piece
  
  attr_reader :piece, :board
  include Slideable

  def initialize(piece, color, board)
    @piece = piece
    @color = color
    @board = board
  end
end


def inspect
  @value.inspect
end
