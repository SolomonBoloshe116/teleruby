#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'animation'
require_relative 'photo_size'
require_relative 'message_entity'

# This object represents a game. Use BotFather to create and edit games,
# their short names will act as unique identifiers.
class Game
  def initialize(game) # :nodoc:
    @game = game
  end

  # Title of the game.
  def title
    @game.title
  end

  # Description of the game.
  def description
    @game.description
  end

  # +Optional.+ Brief description of the game or high scores included in
  # the game message.
  def text
    @game.text
  end

  # +Optional+. Animation that will be displayed in the game message in
  # chats. Upload via BotFather
  def animation
    @game.animation
  end

  # +Optional+. Special entities that appear in text, such as usernames,
  # URLs, bot commands, etc.
  def text_entities
    t_ent = @game.text_entities
    if t_ent.empty?
      return false
    end

    ary = []
    t_ent.each do |ent|
      ary << MessageEntity.new(ent)
    end
    ary
  end

  # Photo that will be displayed in the game message in chats.
  def photo
    poto = @game.photo
    if poto.empty?
      return false
    end

    ary = []
    poto.each do |p|
      ary << PhotoSize.new(p)
    end
    ary
  end
end
