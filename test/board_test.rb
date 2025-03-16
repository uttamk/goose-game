require "minitest/autorun"
require_relative "../lib/board"
require_relative "../lib/player"

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
    @player = Player.new("P1")
  end

  def test_board_initializes_with_63_empty_slots
    (1..63).each do |position|
      assert_equal [], @board.get_slot(position), "Slot #{position} should be empty"
    end
  end

  def test_places_single_player
    position = rand(1..63)
    @board.place_at(position, @player)
    assert_equal [@player], @board.get_slot(position)
  end

  def test_places_two_players_in_different_slots
    player2 = Player.new("P2")
    position1 = rand(1..63)
    position2 = rand(1..63)
    while position2 == position1
      position2 = rand(1..63)
    end

    @board.place_at(position1, @player)
    @board.place_at(position2, player2)

    assert_equal [@player], @board.get_slot(position1)
    assert_equal [player2], @board.get_slot(position2)
  end

  def test_rejects_invalid_positions
    refute @board.place_at(0, @player), "Should reject position 0"
    refute @board.place_at(64, @player), "Should reject position 64"
    refute @board.place_at(-1, @player), "Should reject negative positions"
  end

  def test_returns_winner_when_player_on_final_space
    player2 = Player.new("P2")
    @board.place_at(63, @player)
    @board.place_at(62, player2)

    assert_equal @player, @board.winner
  end

  def test_returns_nil_when_no_winner
    player2 = Player.new("P2")
    @board.place_at(61, @player)
    @board.place_at(62, player2)

    assert_nil @board.winner
  end

  def test_get_position_when_player_not_on_board
    position = @board.get_position(@player)

    assert_nil position
  end

  def test_get_position_when_player_on_board
    @board.place_at(61, @player)
    position = @board.get_position(@player)

    assert_equal 61, position
  end
end 