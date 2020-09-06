#!/usr/bin/ruby
# frozen_string_literal: true

##
# +Monday+, +August+ +24+ +2020+ +EAT+
# ===This object represents a Telegram user.
class User
  def initialize(user) # :nodoc:
    @user = user
  end

  # Unique identifier for this user or bot.
  def id
    @user.id
  end

  # True, if this user is a bot.
  def bot?
    @user.is_bot
  end

  # User's or bot's first name.
  def first_name
    @user.first_name
  end

  # +Optional.+ User 's or BotUser 's last name.
  def last_name
    @user.last_name
  end

  # +Optional+. User's or bot's username
  def username
    @user.username
  end

  # +Optional+.
  # {IETF language}[https://en.wikipedia.org/wiki/IETF_language_tag]
  # tag of the user's language.
  def language_code
    @user.language_code
  end
end

# ===Class returned only in get_me method.
# This class extends from User class.
class BotUser < User
  def initialize(bot) # :nodoc:
    super(bot)
  end

  # +Optional.+ True, if the bot can be invited to groups.
  def can_join_groups
    @user.can_join_groups
  end

  # +Optional.+ True, if privacy mode is disabled for the bot.
  def can_read_all_group_messages?
    @user.can_read_all_group_messages
  end

  # +Optional.+ True, if the bot supports inline queries.
  def supports_inline_queries?
    @user.supports_inline_queries
  end
end
