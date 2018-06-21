class Piece
  def possible_moves?(from, in_directions, max_steps = 8)
    moves = []

    in_directions.each do |dx, dy|
      to = Square.new from.x + dx, from.y + dy
      steps = 0
      while (steps != max_steps) && to.inside_the_board?
        moves << to.to_a
        steps += 1
        to = Square.new to.x + dx, to.y + dy
      end
    end
    moves
  end

  def path(from, to)
    ans = compute(from, to)
    ans = output(ans) << to.position
  end

  def compute(from, to)
    # basically outputs the last node before it hits pos2
    current = from # a Node
    queue = [] # a queue of Nodes to evaluate
    until possible_moves?(current).include?(to.position)
      for possible_move in possible_moves?(current)
        queue << Square.new(possible_move[0], possible_move[1], current)
      end
      current = queue[0]
      queue = queue[1..-1]
    end
    current
  end

  def output(node) # determines the history of the node from compute
    history = []
    until node.nil?
      history.insert(0, node.position)
      node = node.previous
    end
    history
  end
end
