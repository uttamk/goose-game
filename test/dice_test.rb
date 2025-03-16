# frozen_string_literal: true
require_relative '../lib/dice'
require 'minitest/autorun'

class DiceTest < Minitest::Test
  def test_roll
    rolls = Dice.roll

    assert_equal 2, rolls.length
    assert rolls.first <= 6
    assert rolls.first >= 1
    assert rolls.last <= 6
    assert rolls.last >= 1
  end
end
