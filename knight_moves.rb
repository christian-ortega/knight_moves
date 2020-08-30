class Board

  attr_reader :board

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

  def knight_moves(start, destination)

  end

  def possible_moves(location)
    return unless location.class == Array && location.length == 2 && board.include?(location)
    
    result = []
    result.push([location[0] + 1, location[1] + 2]) if board.include? [location[0] + 1, location[1] + 2]
    result.push([location[0] + 2, location[1] + 1]) if board.include? [location[0] + 2, location[1] + 1]
    result.push([location[0] + 2, location[1] - 1]) if board.include? [location[0] + 2, location[1] - 1]
    result.push([location[0] + 1, location[1] - 2]) if board.include? [location[0] + 1, location[1] - 2]
    result.push([location[0] - 1, location[1] - 2]) if board.include? [location[0] - 1, location[1] - 2]
    result.push([location[0] - 2, location[1] - 1]) if board.include? [location[0] - 2, location[1] - 1]
    result.push([location[0] - 2, location[1] + 1]) if board.include? [location[0] - 2, location[1] + 1]
    result.push([location[0] - 1, location[1] + 2]) if board.include? [location[0] - 1, location[1] + 2]

    result
  end
end

b = Board.new(8)
p b.possible_moves([4, 4])