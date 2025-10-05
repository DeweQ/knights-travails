# Describe knight's movement on the chess board
module KnightsTravails
  # Map of possible changes to the starting point
  MAP = [[1, 2], [1, -2], [-1, 2], [-1, -2], [-2, 1], [-2, -1], [2, 1], [2, -1]].freeze

  def self.knights_travails(start, target)
    queue = [[start]]
    visited = []
    until queue.empty?
      current_path = queue.shift
      next if visited.find_index(current_path.last)

      visited << current = current_path.last
      moves = find_possible_moves(current, visited)
      return current_path + [target] if moves.find_index(target)

      moves.each { |m| queue << (current_path + [m]) }
    end
  end

  # Finds possible moves using MAP and starting point. Then removes out of board and visited nodes.
  def self.find_possible_moves(start, visited)
    # TODO: Implement
    all_moves = MAP.map { |coords| [start[0] + coords[0], start[1] + coords[1]] }
    in_bounds = all_moves.select { |e| e[0].between?(0, 7) && e[1].between?(0, 7) }
    in_bounds.reject { |e| visited.find_index(e) }
  end
end
