require_relative 'piece'

class Knight < Piece

  def initialize
    super
  end

  def possible_moves?(from)
    positions = [
        [from.x + 1, from.y + 2], [from.x + 2, from.y + 1],
        [from.x + 2, from.y - 1], [from.x + 1, from.y - 2],
        [from.x - 1, from.y + 2], [from.x - 2, from.y + 1],
        [from.x - 1, from.y - 2], [from.x - 2, from.y - 1]
    ]

    positions.delete_if do |position|
      position = Square.new(*position)
      position.out_of_the_board?
    end

    return positions
  end
end
