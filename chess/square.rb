class Square
  attr_reader :x, :y, :previous

  def initialize(x, y, previous = nil)
    @x = x
    @y = y
    @previous = previous
  end

  def out_of_the_board?
    [x, y].any? { |coordinate| (coordinate < 0) || (coordinate > 7) }
  end

  def inside_the_board?
    !out_of_the_board?
  end

  def to_a
    [x, y]
  end

  def position
    to_a
  end
end
