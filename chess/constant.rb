module StaticContent
  PIECES = %w[Queen Rook Knight].freeze
  ROWS = %w[a b c d e f g h].freeze
  COLUMNS = 1.upto(8).map(&:to_s).freeze
  COLORS = %w(black white)
end