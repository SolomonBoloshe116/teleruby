#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'user'

##
# +Monday+, +August+ +24+ +2020+ +EAT+
# ===This object represents one special entity in a text message.
# For example, +hashtags,+ +usernames+, +URLs,+ etc.
class MessageEntity
  def initialize(msg) # :nodoc:
    @msg = msg
    freeze
  end

  # Type of the entity. Can be +mention+( @username ), +hashtag+( #hashtag ),
  # +cashtag+( $USD ), +bot_command+( /start@jobs_bot ),
  # +url+( https://telegram.org ), +email+( do-not-reply@telegram.org ),
  # +phone_number+( +1-212-555-0123 ), +bold+(bold text),
  # *italic*(italic text), +underline+(underlined text), 
  # +strikethrough+(strikethrough text), +code+
  # (monowidth string), +pre+ (monowidth block),
  # +text_link+(for clickable text URLs),
  # +text_mention+ (for users without usernames)
  def type
    @msg.type
  end

  # Offset in UTF-16 code units to the start of the entity.
  def offset
    @msg.offset
  end

  # Length of the entity in UTF-16 code units.
  def length
    @msg.length
  end

  # +Optional.+ For +text_link+ only, url that will be opened after user
  # taps on the text.
  def url
    @msg.url
  end

  # +Optional.+ For +pre+ only, the programming language of the entity text.
  def language
    @msg.language
  end

  # +Optional+. For text_mention? only, the mentioned user.
  # Returns User object
  def user
    usr = @msg.user
    unless user.nil?
      return User.new(usr)
    end

    false
  end

  # Returns true if entity #type is mention else false is returned.
  def mention?
    type.eql? 'mention'
  end

  # Returns true if entity #type is bot_command else false is returned.
  def bot_command?
    type.eql? 'bot_command'
  end

  # Return true if entity #type is url else false is returned.
  def link?
    type.elq? 'url'
  end

  # Returns true if entity #type is email else false is returned.
  def email?
    type.eql? 'email'
  end

  # Return true if entity #type is +phone_number+ else false is returned.
  def phone_number?
    type.eql? 'phone_number'
  end

  # Returns true if entity #type is +text_link+ else false is returned.
  def text_link?
    type.eql? 'text_link'
  end

  # Returns true if entity #type is +text_mention+ else false is returned.
  def text_mention?
    type.eql? 'text_mention'
  end
end
