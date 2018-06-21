require_relative '../chess/square'
require_relative '../chess/piece'
require_relative '../chess/queen'
require_relative '../chess/knight'
require_relative '../chess/rook'
require_relative '../chess'

describe 'Square' do
  let(:square1) { make_square 0, 0 }
  let(:square2) { make_square 7, 7 }
  let(:square3) { make_square 0, 0 }

  it 'can be converted to an array' do
    expect(square1.to_a).to eq [0, 0]
  end

  it 'is false if coordinates differ' do
    expect(square1 == square2).to eq false
  end

  it 'is true if coordinates are the same' do
    expect(square1.to_a == square3.to_a).to eq true
  end

  it 'is true if square is out of the chess board' do
    square = make_square(-1, 8)
    expect(square.out_of_the_board?).to eq true
  end
end

describe 'Piece' do
  it 'finds possible moves in a given direction' do
    square = make_square(3, 6)
    piece = make_piece
    expect(piece.possible_moves?(square, [[1, 0]])).to include([5, 6])
    expect(piece.possible_moves?(square, [[1, 0]])).not_to include([5, 7])
  end
end

describe 'Queen' do
  before(:each) do
    @queen = make_queen
  end

  it 'finds possible valid moves' do
    from = make_square(3, 7)
    expect(@queen.possible_moves?(from)).to include([7, 3])
    expect(@queen.possible_moves?(from)).not_to include([7, 6])
  end

  describe 'computes from starting square to the destination square' do
    before(:each) do
      from = Square.new(3, 5)
      to = Square.new(7, 7)
      @route = @queen.path(from, to)
    end

    it 'should have valid moves' do
      expect(@route[1]).to eq([5, 5])
    end

    it 'should have valid steps' do
      expect(@route.count - 1).to eq 2
    end
  end
end

describe 'Knight' do
  before(:each) do
    @knight = make_knight
  end

  it 'finds possible valid moves' do
    from = make_square(1, 0)
    expect(@knight.possible_moves?(from)).to include([3, 1])
    expect(@knight.possible_moves?(from)).not_to include([7, 6])
  end

  describe 'computes from starting square to the destination square' do
    before(:each) do
      from = Square.new(3, 3)
      to = Square.new(7, 7)
      @route = @knight.path(from, to)
    end

    it 'should have valid moves' do
      expect(@route[1]).to eq([4, 5])
      expect(@route[2]).to eq([5, 7])
      expect(@route[3]).to eq([6, 5])
    end

    it 'should have valid steps' do
      expect(@route.count - 1).to eq 4
    end
  end
end

describe 'Rook' do
  before(:each) do
    @rook = make_rook
  end

  it 'finds possible valid moves' do
    from = make_square(3, 7)
    expect(@rook.possible_moves?(from)).to include([1, 7])
    expect(@rook.possible_moves?(from)).not_to include([7, 6])
  end

  describe 'computes from starting square to the destination square' do
    before(:each) do
      from = Square.new(1, 3)
      to = Square.new(7, 7)
      @route = @rook.path(from, to)
    end

    it 'should have valid moves' do
      expect(@route[1]).to eq([7, 3])
    end

    it 'should have valid steps' do
      expect(@route.count - 1).to eq 2
    end
  end
end

describe 'chess' do
  it 'should have valid positions' do
    chess = Chess.new('Knight', 'd3')
    positions = chess.send(:generate_random_opp_pieces)
    p positions
  end
end

def make_square(*args)
  Square.new(*args)
end

def make_piece(*args)
  Piece.new(*args)
end

def make_queen(*args)
  Queen.new(*args)
end

def make_knight
  Knight.new
end

def make_rook
  Rook.new
end
