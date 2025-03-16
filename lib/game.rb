class Game
  attr_reader :players

  BOARD_SIZE = 63
  SPECIAL_SPACES = {
    6 => "Bridge: Go to space 12",
    19 => "Inn: Lose one turn",
    31 => "Well: Wait until another player arrives",
    42 => "Maze: Go back to space 39",
    52 => "Prison: Wait until another player arrives",
    58 => "Death: Start over from the beginning"
  }

  def initialize
    @players = []
    @position = 0
  end

  def add_player(player)
    return false if @players.include?(player)
    @players << player
    true
  end

  def play_turn
    roll = roll_dice
    new_position = @position + roll
    
    if new_position > BOARD_SIZE
      puts "You rolled #{roll}. Too high! You need exactly #{BOARD_SIZE - @position} to win."
      return false
    end

    @position = new_position
    puts "You rolled #{roll} and moved to space #{@position}"
    
    if SPECIAL_SPACES.key?(@position)
      puts "*** #{SPECIAL_SPACES[@position]} ***"
    end

    if @position == BOARD_SIZE
      puts "Congratulations! You've won!"
      return true
    end

    false
  end

  private

  def roll_dice
    (rand(1..6) + rand(1..6))
  end
end 