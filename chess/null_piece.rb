require 'singleton'
require_relative './piece'

class NullPiece < Piece
  include Singleton

  def initialize
    @piece = nil
  end
end

def inspect
  @piece.inspect
end