#!/usr/bin/ruby
# frozen_string_literal: true

# +Sunday+, +August+ +23+ +2020+ +EAT+

# ===This object represents an animated emoji that displays a random value.
class Dice
  def initialize(dice) # :nodoc:
    @dice = dice
  end

  # Emoji on which the dice throw animation is based.
  def emoji
    @dice.emoji
  end

  # Value of the dice
  def value
    @dice.value
  end
end
