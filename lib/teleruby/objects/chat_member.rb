#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'user'

##
# +Monday+, +August+ +24+ +2020+ +EAT+
# ===This object contains information about one member of a chat.
class ChatMember
  def initialize(mem) # :nodoc:
    @memb = mem
  end

  # Information about the user.
  # Return User object.
  def user
    User.new(@memb.user)
  end

  # The member's status in the chat. Can be +creator+, +administrator+,
  # +member+, +restricted+, +left+ or +kicked+.
  def status
    @memb.status
  end

  # +Optional.+ Owner and administrators only. Custom title for this user.
  # check if user is admin using #admin? before going to use this method,
  # unless nil is returned.
  def custom_title
    @memb.custom_title
  end

  # +Optional.+ Restricted and kicked only. Date when restrictions will be
  # lifted for this user; unix time.
  # Check if user is restricted or kicked using #member? before going to use
  # this method else if user is not kicked or restricted then nil is returned.
  def until_date
    @memb.until_date
  end

  # +Optional.+ Administrators only. True, if the bot is allowed to edit
  # administrator privileges of that user.
  def can_be_edited?
    @memb.can_be_edited
  end

  # +Optional.+ Administrators only. True, if the administrator can post in
  # the channel; channels only.
  def can_post_messages?
    @memb.can_post_messages
  end

  # +Optional.+ Administrators only. True, if the administrator can edit
  # messages of other users and can pin messages; channels only.
  def can_edit_messages?
    @memb.can_edit_messages
  end

  # +Optional.+ Administrators only. True, if the administrator can delete
  # messages of other users.
  def can_delete_messages?
    @memb.can_delete_messages
  end

  # +Optional.+ Administrators only. True, if the administrator can restrict,
  # #ban_chat_member or #unban_chat_member s.
  def can_restrict_members?
    @memb.can_restrict_members
  end

  # +Optional.+ Administrators only. True, if the administrator can add new
  # administrators with a subset of their own privileges or demote
  # administrators that he has promoted, directly or indirectly
  # (promoted by administrators that were appointed by the user)
  def can_promote_members?
    @memb.can_promote_members
  end

  # +Optional.+ Administrators and restricted only. True, if the user is
  # allowed to change the chat title, photo and other settings.
  def can_change_info?
    @memb.can_change_info
  end

  # +Optional.+ Administrators and restricted only. True, if the user
  # is allowed to invite new users to the chat.
  def can_invite_users?
    @memb.can_invite_users
  end

  # +Optional.+ Administrators and restricted only. True, if the user is
  # allowed to pin messages; groups and supergroups only.
  def can_pin_messages?
    @memb.can_pin_messages
  end

  # +Optional.+ Restricted only. True, if the user is a member of the
  # chat at the moment of the reques.
  def member?
    @memb.is_member
  end

  # +Optional+. Restricted only. True, if the user is allowed to send text
  # messages, contacts, locations and venues.
  def can_send_messages?
    @memb.can_send_messages
  end

  # +Optional+. Restricted only. True, if the user is allowed to send
  # audios, documents, photos, videos, video notes and voice notes.
  def can_send_media_messages?
    @memb.can_send_media_messages
  end

  # +Optional.+ Restricted only. True, if the user is allowed to send polls
  def can_send_polls?
    @memb.can_send_polls
  end

  # +Optional.+ Restricted only. True, if the user is allowed to send
  # animations, games, stickers and use inline bots.
  def can_send_other_messages?
    @memb.can_send_other_messages
  end

  # +Optional.+ Restricted only. True, if the user is allowed to add
  # web page previews to their messages.
  def can_add_web_page_previews?
    @memb.can_add_web_page_previews
  end

  # Returns true if user if left the chat. +NB:+ That does not mean it
  # checks if user is a part of chat. Kicked != left
  def left?
    status.eql? 'left'
  end

  # Returns true if user is admin
  def admin?
    (status.eql? 'creator') || (status.eql? 'administrator')
  end
end
