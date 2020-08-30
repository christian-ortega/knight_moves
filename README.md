# knight_moves
THE ODIN PROJECT: DATA STRUCTURES AND ALGORITHMS

### Knight Moves
This project finds the shortest path from a given starting tile to a given destination tile for a knight on a chess board with given dimensions.

The algorithm for finding the shortest path in this case is a breadth-first search of a graph. A queue is first populated with the given starting tile. As tiles are removed from the front of the queue, the set of possible subsequent moves from each tile is added to the back of the queue. To optimize performance, each tile that is added to the queue is marked as visited, which prevents these same tiles from being added as duplicates in future iterations. This process repeats until the destination tile is found, in which case the shortest path is returned.