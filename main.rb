require_relative "lib/knight_moves"

def all_shortest_paths(start, board_size)
  board = Board.new(board_size)

  puts "Shortest path from #{start} to:"
  board_size.times do |j|
    board_size.times do |i|
      print "  #{[i, j]}: "
      str = ""
      board.knight_moves(start, [i, j]).each { |e| str += "#{e} -> " }
      puts str.chomp(" -> ")
      puts ""
    end
  end
end

def shortest_path(start, destination, board_size)
  board = Board.new(board_size)

  puts "Shortest path from #{start} to #{destination}:"
  str = "  "
  board.knight_moves(start, destination).each { |e| str += "#{e} -> " }
  puts str.chomp(" -> ")
  puts ""
end

all_shortest_paths([3,3], 8)

shortest_path([1,1], [1,1], 8)
shortest_path([1,1], [3,0], 8)
shortest_path([1,1], [0,0], 8)