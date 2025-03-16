require_relative "./board"
class Game
  attr_reader :players

  def initialize
    @players = []
    @board = Board.new
  end

  def add_player(player)
    return false if @players.include?(player)
    @players << player
    true
  end
end 