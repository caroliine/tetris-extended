# Caroline Alexander
# This is the only file you turn in, so do not modify the other files as
# part of your solution.

class MyPiece < Piece
  # class method to choose the next piece
  def self.next_piece (board)
    MyPiece.new(All_My_Pieces.sample, board)
  end
 
  # The constant All_My_Pieces should be declared here
  All_My_Pieces = All_Pieces + [rotations([[0,0], [0,1], [0,2], [1,0], [1,1]]), # square w/ tail
                                rotations([[0,0], [0,1], [0,2], [0,3], [0,4], [0,5]]), # 5 block line 
                                #[[0,0], [1,0], [2,0], [3,0], [4,0], [5,0]]],
                                rotations([[0,0], [0,1], [1,0]])] # square w/out corner =
  Cheat_Piece = [[[0,0]]]

  # class method to choose the next piece
  def self.make_cheat_piece (board)
    MyPiece.new(Cheat_Piece.sample, board)
  end
end

class MyBoard < Board
  # your enhancements here
   def initialize (game)
    @grid = Array.new(num_rows) {Array.new(num_columns)}
    @current_block = MyPiece.next_piece(self)
    @score = 0
    @game = game
    @delay = 500
   end
  
   # gets the next piece
   def next_piece
     @current_block = MyPiece.next_piece(self)
     @current_pos = nil
   end 

   def store_current
     locations = @current_block.current_rotation 
     displacement = @current_block.position
     (0..(@current_block.current_rotation.size - 1)).each{|index|
       current = locations[index];
       @grid[current[1]+displacement[1]][current[0]+displacement[0]] = 
       @current_pos[index]
    }
    remove_filled
     @delay = [@delay - 2, 80].max
   end

   def cheat
     if !game_over? and @score < 100
       # nothing happens 
     else
       @score -= 100
       @current_block = MyPiece.make_cheat_piece(self)
     end
   end 
end

class MyTetris < Tetris
  # creates a canvas and the board that interacts with it
  def set_board
    @canvas = TetrisCanvas.new
    @board = MyBoard.new(self)
    @canvas.place(@board.block_size * @board.num_rows + 3,
                  @board.block_size * @board.num_columns + 6, 24, 80)
    @board.draw
  end

  def key_bindings
    super
    @root.bind('u', lambda{@board.rotate_clockwise;@board.rotate_clockwise})
    @root.bind('c', lambda{@board.cheat})
  end

end


