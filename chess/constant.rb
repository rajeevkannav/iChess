module StaticContent

  PIECES = %w[Queen Rook Knight].freeze
  ROWS = %w[a b c d e f g h].freeze
  COLUMNS = 1.upto(8).map(&:to_s).freeze
  WHITE = 'white'.freeze
  BLACK = 'black'.freeze
  OPPOSING_PIECES = 8

end