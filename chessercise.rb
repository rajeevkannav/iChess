require_relative 'chess'

piece, target, position = nil

if ARGV[0] == '-piece' && ARGV[2] == '-position' || ARGV[4] == '-target'
  piece = ARGV[1]
  position = ARGV[3]
  target = ARGV[5]
else
  puts 'Invalid options'
  puts 'Example: '
  puts 'chessercise.rb -piece KNIGHT -position d2 -target black'
  exit
end

chess = Chess.new(piece, position, target)
chess.play
