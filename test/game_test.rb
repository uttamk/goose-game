require "minitest/autorun"
require_relative "../lib/game"
require_relative "../lib/player"

class GameTest < Minitest::Test
  def setup
    @game = Game.new
  end

  def test_game_starts_with_empty_state
    assert_empty @game.players
  end

  def test_adds_player_to_game
    player = Player.new("P1")
    @game.add_player(player)
    assert_includes @game.players, player
  end

  def test_adds_multiple_players
    player1 = Player.new("P1")
    player2 = Player.new("P2")
    
    @game.add_player(player1)
    @game.add_player(player2)
    
    assert_equal [player1, player2], @game.players
  end

  def test_prevents_duplicate_players
    player = Player.new("P1")
    
    @game.add_player(player)
    result = @game.add_player(player)
    
    refute result, "Should not add the same player twice"
    assert_equal 1, @game.players.size
  end
end 