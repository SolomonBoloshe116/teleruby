#!/usr/bin/ruby
# frozen_string_literal: true

# +Saturday+, +August+ +22+ +2020+ +EAT+

# ===This object represents a bot command

class BotCommand
  def initialize(bot) # :nodoc:
    @bot = bot
    freeze
  end

  # Text of the command, 1-32 characters. Can contain only lowercase
  # English letters, digits and underscores.
  def command
    @bot.command
  end

  # Description of the command, 3-256 characters.
  def description
    @bot.description
  end
end
