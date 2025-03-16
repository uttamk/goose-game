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

  def move(player)
    rolls = Dice.roll

    new_position = rolls.sum + @board.get_position(player)
    @board.place_at(new_position, player)

    new_position
  end
end 