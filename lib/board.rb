class Board
  def initialize
    @slots = Array.new(63) { [] } # Each slot is now an array that can hold multiple pieces
  end

  def get_position(player)
    idx = @slots.index { |arr| arr.include?(player) }
    if idx.nil?
      return nil
    end
    idx + 1
  end

  def get_slot(position)
    @slots[position - 1] if valid_position?(position)
  end

  def place_at(position, piece)
    if valid_position?(position)
      @slots[position - 1] << piece # Add piece to the array at this position
      true
    else
      false
    end
  end

  def remove_from(position, piece)
    if valid_position?(position)
      @slots[position - 1].delete(piece)
      true
    else
      false
    end
  end

  def winner
    get_slot(63)&.first # Return the first player in slot 63, or nil if empty
  end

  private

  def valid_position?(position)
    position.between?(1, 63)
  end
end 