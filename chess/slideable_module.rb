module Slideable

  def left_slide(start_position)
    x, y = start_position
    var = [] 
    y -= 1  
    while y != 0 && @board.grid[x][y].is_a?(NullPiece)
      var << [x,y]
      y -= 1
    end
    var
  end

  def right_slide(start_position)
    var = []
    x, y = start_position
    y += 1
    until y == 7 || !@board.grid[x][y].piece.nil?
      var << [x,y]
      y += 1
    end
    var
  end

  def up_slide(start_position)
    var = []
    x, y = start_position
    until x == 0 || !@board.grid[x][y].piece.nil?
      x -= 1
      var << [x,y]
    end
    var
  end

  def down_slide(start_position)
    var = []
    x, y = start_position
    x += 1
    var << [x,y]
    until x == 7 || !@board.grid[x][y].piece.nil?
      x += 1
      var << [x,y]
    end
    var
  end


  def up_left_slide(start_position)
    var = []
    x, y = start_position
    until x == 0 || y == 0 || !@board.grid[x][y].piece.nil?
      x -= 1
      y -= 1
      var << [x,y]
    end
    var
  end

  def down_left_slide(start_position)
    var = []
    x, y = start_position
    until x == 7 || y == 0 || !@board.grid[x][y].piece.nil?
      x += 1
      y -= 1
      var << [x,y]
    end
    var
  end

  def up_right_slide(start_position)
    var = []
    x, y = start_position
    until x == 0 || y == 7 || !@board.grid[x][y].piece.nil?
      x -= 1
      y += 1
      var << [x,y]
    end
    var
  end

  def down_right_slide(start_position)
    var = []
    x, y = start_position
    until x == 7 || y == 7 || !@board.grid[x][y].piece.nil?
      x += 1
      y += 1
      var << [x,y]
    end
    var
  end
  
end