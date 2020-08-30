class Board

  public

  def initialize(dimension)
    @board = build_board(dimension)
  end

  def knight_moves(start, destination)
    return unless board.include?(start) && board.include?(destination)

    # Reconstruct board to include a visited boolean with each tile (improves performance)
    board_as_hash = build_board_as_hash

    queue = []
    shortest_path = []

    queue.push({ location: start, prev: [] })

    loop do
      move = queue.shift
      mark_visited(move[:location], board_as_hash)
      shortest_path = move[:prev].push(move[:location])
      if move[:location] == destination
        break
      else
        # takes in all possible moves from current move, excluding previously visited moves
        possible_moves_array = possible_moves(move[:location], board_as_hash)

        # marks possible moves as visited (improves performance)
        possible_moves_array.each { |e| mark_visited(e, board_as_hash)}

        # add possible moves to queue with shortest path attached
        queue.concat(possible_moves_array.map { |e| { location: e, prev: Array.new(shortest_path)} })
      end
    end

    shortest_path
  end

  
  private

  attr_reader :board

  def build_board(dimension)
    new_board = []

    dimension.times do |j|
      dimension.times do |i|
        new_board.push([i, j])
      end
    end

    new_board
  end

  def build_board_as_hash
    board.map { |e| { tile: e, visited: false} }
  end

  # Finds all possible moves for a knight at a given tile location
  def possible_moves(location, board_as_hash = nil)
    return unless board.include?(location)
    
    result = []
    x = location[0]
    y = location[1]

    # Possible move locations
    possible_moves_array = [
      [x + 1, y + 2],
      [x + 2, y + 1],
      [x + 2, y - 1],
      [x + 1, y - 2],
      [x - 1, y - 2],
      [x - 2, y - 1],
      [x - 2, y + 1],
      [x - 1, y + 2]
    ]

    # Filter out locations that are not on board (or that have already been visited, in the context of knight_moves function)
    possible_moves_array.select { |e| board.include?(e) && (board_as_hash.nil? || !visited?(e, board_as_hash))}
  end

  def mark_visited(location, board_as_hash)
    index = board_as_hash.index { |e| e[:tile] == location }
    board_as_hash[index][:visited] = true
  end

  def visited?(location, board_as_hash)
    index = board_as_hash.index { |e| e[:tile] == location }
    return true if index.nil?
    board_as_hash[index][:visited]
  end
end
