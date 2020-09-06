#!/usr/bin/ruby
# frozen_string_literal: true

# ===This object represents one button of an inline keyboard.
# You must use exactly one of the optional fields.
class InlineKeyboardButton
  def initialize(button) # :nodoc:
    @button = button
  end

  # Label text on the button.
  def text
    @button.text
  end

  # +Optional+. HTTP or tg:// url to be opened when button is pressed
  def url
    @button.url
  end

  # +Optional+. An HTTP URL used to automatically authorize the user.
  # Can be used as a replacement for the Telegram 
  # {Login Widget.}[https://core.telegram.org/widgets/login]
  def login_url
    @button.login_url
  end

  # +Optional+. Data to be sent in a CallbackQuery to the bot when
  # button is pressed, 1-64 bytes.
  def callback_data
    @button.callback_data
  end

  # +Optional+. If set, pressing the button will prompt the user to
  # select one of their chats, open that chat and insert the bot's
  # username and the specified inline query in the input field.
  # Can be empty, in which case just the bot's username will be inserted.
  def switch_inline_query
    @button.switch_inline_query
  end

  # +Optional.+ If set, pressing the button will insert the bot's username
  # and the specified inline query in the current chat's input field.
  # Can be empty, in which case only the bot's username will be inserted.
  def switch_inline_query_current_chat
    @button.switch_inline_query_current_chat
  end

  # +Optional+. Description of the game that will be launched when the
  # user presses the button.
  def callback_game
    @button.callback_game
  end

  # +Optional+. Specify True, to send a Pay button.
  def pay?
    @button.pay
  end
end
