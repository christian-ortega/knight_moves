def knight_moves(start, destination)

end

class Board
  def initialize(dimension)
    @board = build_board(dimension)
  end

  def build_board(dimension)
    new_board = []

    dimension.times do |j|
      dimension.times do |i|
        new_board.push([i, j])
      end
    end

    new_board
  end
end

b = Board.new(8)
p b