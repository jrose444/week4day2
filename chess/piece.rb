class Piece
  def initialize
    @value = 'piece'
  end
end

class NullPiece < Piece
  @value = 'null_piece'
end

def inspect
  @value.inspect
end