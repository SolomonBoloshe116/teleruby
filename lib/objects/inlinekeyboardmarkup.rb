#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'inlinekeyboardbutton'

# This object represents an inline keyboard that appears
# right next to the message it belongs to.
class InlineKeyboardMarkup
  def initialize(mup) # :nodoc:
    @mup = mup
  end

  # Array of button rows, each represented by an Array of
  # InlineKeyboardButton objects.
  def inline_keyboard
    data = @mup.inline_keyboard
    if data.empty?
      return false
    end
    ary = []
    data.each do |e|
      ary2 = []
      e.each do |f|
        ary2 << InlineKeyboardButton.new(f)
      end
      ary << ary2
    end
    ary
  end
end
