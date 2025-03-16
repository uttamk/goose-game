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
    roll_sum = rolls.first + rolls.last

    @board.place_at(roll_sum, player)

    roll_sum
  end
end 