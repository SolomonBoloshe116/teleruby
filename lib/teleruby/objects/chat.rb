#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'chat_permissions'
require_relative 'message'
require_relative 'chat_photo'

# +Sunday+, +August+ +23+ +2020+ +EAT+

# ===This object represents a chat.
class Chat
  def initialize(chat) # :nodoc:
    @chat = chat
  end

  # Unique identifier for this chat.
  def id
    @chat.id
  end

  # Type of chat, can be either +private+, +group+,
  # +supergroup+ or +channel+.
  def type
    @chat.type
  end

  # +Optional+. *Title*, for +supergroups+, +channels+ and +group+ chats.
  def title
    @chat.title
  end

  # +Optional+. *Username*, for +private+ chats, +supergroups+ and
  # +channels+ if available else nil is returned.
  def username
    @chat.username
  end

  # Returns true if chat type is private else false is returned.
  def private?
    type.eql? 'private'
  end

  # Returns true if chat type is supergroup else false is returned.
  def supergroup?
    type.eql? 'supergroup'
  end

  # Returns true if chat type is channel else false is returned.
  def channel?
    type.eql? 'channel'
  end

  # Returns true if chat has title else false is returned.
  def has_title?
    title.nil?
  end
end

# ====Returned only for private chat
# It extends from Chat class.
class PrivateChat < Chat
  def initialize(chat) # :nodoc:
    super(chat)
  end

  # +Optional+. First name of the other party in a +private+ chat.
  def first_name
    @chat.first_name
  end

  # +Optional.+ Last name of the other party in a +private+ chat.
  def last_name
    @chat.last_name
  end
end

# ==== This object is returned only in get_chat methods
# It extends from Chat class.
class GetChat < Chat
  def initialize(chat) # :nodoc:
    super(chat)
  end

  # +Optional+. Returns ChatPhoto if available else false is returned.
  def photo
    data = @chat.photo
    unless data.nil?
      return ChatPhoto.new(data)
    end

    false
  end

  # +Optional.+ Description, for +groups+, +supergroups+ and +channel+
  # chats.
  def description
    @chat.description
  end

  # +Optional.+ Chat invite link, for +groups+, +supergroups+ and +channel+
  # chats. Each administrator in a chat generates their own invite links,
  # so the bot must first generate the link using +export_chat_link.+
  def invite_link
    @chat.invite_link
  end

  # +Optional+. Pinned message, for +groups+, +supergroups+ and +channels.+
  # Returns Message object.
  def pinned_message
    data = @chat.pinned_message
    unless data.nil?
      return Message.new(data)
    end

    false
  end

  # +Optional.+ Default chat member permissions, for +groups+ and
  # +supergroups+. Returns ChatPermissions object.
  def permissions
    data = @chat.permissions
    unless data.nil?
      return ChatPermissions.new(data)
    end

    false
  end

  # +Optional.+ For +supergroups,+ the minimum allowed delay between
  # consecutive messages sent by each unpriviledged user.
  def slow_mode_delay
    @chat.slow_mode_delay
  end

  # +Optional.+ For +supergroups,+ name of group sticker set.
  def sticker_set_name
    @chat.sticker_set_name
  end

  # +Optional.+ True, if the bot can change the group sticker set.
  def can_set_sticker_set?
    @chat.can_set_sticker_set
  end

  # Returns true if photo is set to chat else false is returned.
  def has_photo?
    photo ? true : false
  end

  # Returns true if description is set to chat else false is returned.
  def has_description?
    description.nil?
  end

  # Returns true if message is pinned in chat else false is returned.
  def pinned_message?
    pinned_message ? true : false
  end

  # Returns true if slow mode delay is set in chat.
  def slow_mode_delay_set?
    slow_mode_delay.nil?
  end
end
