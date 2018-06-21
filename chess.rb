require_relative 'chess/constant'
require_relative 'chess/square'
require_relative 'chess/rook'
require_relative 'chess/queen'
require_relative 'chess/knight'

class Chess

  ###### Module inclusion ############
  include StaticContent

  ###### Accessible Attributes  ######
  attr_reader :piece, :position

  def initialize(piece, position, target = nil)

    @piece = eval(piece).new if valid_piece? piece

    @position = {
        x: ROWS.index(position[0]),
        y: COLUMNS.index(position[1])
    } if valid_position? position

    @target = target if (target and valid_target?(target))

  end

  def generate_moves
    moves = @piece.possible_moves?(Square.new(@position[:x], @position[:y]))
    moves.map! {|move| ROWS[move[0]] + COLUMNS[move[1]]}.join(', ')
    yield moves.reverse! if block_given?
  end

  def minimum_set_of_moves(tile = most_distant_tile)
    path = @piece.path(Square.new(@position[:x], @position[:y]), Square.new(tile[0], tile[1]))
    yield path if block_given?
  end

  def play
    generate_moves do |moves|
      str = <<STR

      #{moves}

STR
      puts str
    end

    minimum_set_of_moves do |target|
      str = <<STR

      You made it in #{target.count - 1} steps!
      #{target.to_s}

STR
      puts str
    end if @target
  end

  private

  def generate_random_opp_pieces(opposing_pieces_position = [])
    8.times do
      begin
        position = [rand(0..7), rand(0..7)]
      end while position == [@position[:x], @position[:y]]
      opposing_pieces_position << position
    end
    puts "8 Random opposing pieces: #{opposing_pieces_position}"
    opposing_pieces_position
  end

  def most_distant_tile(distance = 0, max_distant_title = nil)
    generate_random_opp_pieces.each do |to|
      d = Math.sqrt(((@position[:x] - to[0]).abs ** 2) + ((@position[:y] - to[1]).abs ** 2))
      if d >= distance
        max_distant_title = to
        distance = d
      end
    end
    puts "Most distant tile: #{max_distant_title}"
    max_distant_title
  end

  def valid_piece? piece
    (puts 'Invalid Piece' and exit) unless PIECES.include? piece
    true
  end

  def valid_position? position
    (puts 'Invalid Position' and exit) unless position.size == 2 && ROWS.include?(position[0]) && COLUMNS.include?(position[1])
    true
  end

  def valid_target? target
    (puts 'Invalid Target' and exit) unless COLORS.include?(target)
    true
  end

end
