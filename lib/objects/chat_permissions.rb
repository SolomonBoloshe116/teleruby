#!/usr/bin/ruby
# frozen_string_literal: true

##
# +Monday+, +August+ +24+ +2020+ +EAT+
# ===Describes actions that a non-administrator user is allowed to take in a chat.
class ChatPermissions
  def initialize(perm) # :nodoc:
    @perm = perm
  end

  # +Optional+. True, if the user is allowed to send text messages, contacts,
  # locations and venues.
  def can_send_messages?
    @perm.can_send_messages
  end

  # +Optional.+ True, if the user is allowed to send +audios+, +documents+,
  # +photos,+ +videos+, +video_notes+ and +voice_notes,+ 
  # implies can_send_messages.
  def can_send_media_messages?
    @perm.can_send_media_messages
  end

  # +Optional+. True, if the user is allowed to +send_polls+, implies
  # +can_send_messages?+
  def can_send_polls?
    @perm.can_send_polls
  end

  # +Optional.+ True, if the user is allowed to send animations, games
  # stickers and use inline bots, implies can_send_media_messages
  def can_send_other_messages?
    @perm.can_send_other_messages
  end

  # +Optional.+ True, if the user is allowed to add web page previews to
  # their messages, implies +can_send_media_messages?+
  def can_add_web_page_previews?
    @perm.can_add_web_page_previews
  end

  # +Optional.+ True, if the user is allowed to change the chat title,
  # photo and other settings. Ignored in public supergroups.
  def can_change_info?
    @perm.can_change_info
  end

  # +Optional.+ True, if the user is allowed to invite new users to the chat.
  def can_invite_users?
    @perm.can_invite_users
  end

  # +Optional.+ True, if the user is allowed to pin messages.
  # Ignored in public supergroups.
  def can_pin_messages?
    @perm.can_pin_messages
  end
end
