#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'user'
require_relative 'chat'
require_relative 'message_entity'
require_relative 'animation'
require_relative 'audio'
require_relative 'document'
require_relative 'photo_size'
require_relative 'sticker'
require_relative 'video'
require_relative 'contact'
require_relative 'dice'
require_relative 'venue'
require_relative 'game'
require_relative 'location'
require_relative 'inlinekeyboardmarkup'

##
# +Monday+, +August+ +24+ +2020+ +EAT+
# ===This object represents a message.
class Message
  def initialize(msg) # :nodoc:
    @message = msg
  end

  # Unique message identifier inside the chat.
  def message_id
    @message.message_id
  end

  # +Optional.+ Sender, empty for messages sent to channels.
  # Returns User object.
  def from
    frm = @message.from
    return User.new(frm) if frm

    false
  end

  # TDate Object the message was sent in Unix time
  def date
    return TDate.new(@message.date)
  end

  # Conversation the message belongs to.
  # Returns Chat object
  def chat
    Chat.new(@message.chat)
  end

  # +Optional.+ For forwarded messages, sender of the original message.
  # Returns Chat object
  def forward_from
    f_from = @message.forward_from
    return User.new(f_from) if f_from

    false
  end

  # +Optional.+ For messages forwarded from channels, information about
  # the original channel.
  # Returns Chat object.
  def forward_from_chat
    ff_chat = @message.forward_from_chat
    return Chat.new(ff_chat) if ff_chat

    false
  end

  # +Optional.+ For messages forwarded from channels, identifier of the
  # original message in the channel.
  def forward_from_message_id
    @message.forward_from_message_id
  end

  # +Optional.+ For messages forwarded from channels, signature of the
  # post author if present.
  def forward_signature
    @message.forward_signature
  end

  # +Optional+. Sender's name for messages forwarded from users who
  # disallow adding a link to their account in forwarded messages.
  def forward_sender_name
    @message.forward_sender_name
  end

  # +Optional.+ For forwarded messages, date the original message was
  # sent in Unix time.
  # Returns TDate object.
  def forward_date
    TDate.new(@message.forward_date)
  end

  # +Optional.+ For replies, the original message. Note that the Message
  # object in this field will not contain further #reply_to_message
  # fields even if it itself is a reply.
  # Returns Message object
  def reply_to_message
    r_t_msg = @message.reply_to_message
    return Message.new(r_t_msg) if r_t_msg

    false
  end

  # +Optional+. Bot through which the message was sent.
  # Returns User object.
  def via_bot
    v_bot = @message.via_bot
    return User.new(v_bot) if v_bot

    false
  end

  # +Optional+. Retuns TDate object.
  def edit_date
    TDate.new(@messag.edit_date)
  end

  # +Optional+. The unique identifier of a media message group this
  # message belongs to.
  def media_group_id
    @message.media_group_id
  end

  # +Optional.+ Signature of the post author for messages in channels.
  def author_signature
    @message.author_signature
  end

  # +Optional+. For text messages, the actual UTF-8 text of the message,
  # 0-4096 characters
  def text
    @message.text
  end

  # +Optional.+ For text messages, special entities like usernames,
  # URLs, bot commands, etc. that appear in the text.
  # Returns array of MessageEntity object
  def entities
    ary_entity = []
    entitys = @message.entities
    if entitys.empty?
      return false
    end

    entitys.each do |ent|
      ary_entity << MessageEntity.new(ent)
    end
    ary_entity
  end

  # +Optional.+ Message is an animation, information about the animation.
  # For backward compatibility, when this field is set, the document
  # field will also be set.
  # Returns Animation object
  def animation
    an = @message.animation
    return Animation.new(an) if an

    false
  end

  # +Optional+. message is an Audio file, information about the file.
  def audio
    ad = @message.audio
    return Audio.new(ad) if ad

    false
  end

  # +Optional+. message is a general file, information about the file.
  # Returns Document object.
  def document
    doc = @message.document
    return Document.new(doc) if doc

    false
  end

  # +Optional+. message is a Photo, available sizes of the photo.
  # returns array of PhotoSize object
  def photo
    poto = @message.photo
    if poto.empty?
      return false
    end

    e_photo = []
    poto.each do
      e_photo << PhotoSize.new(e_photo)
    end
    e_photo
  end

  # +Optional.+ Message is a sticker, information about the sticker
  # returns Sticker object
  def sticker
    stiker = @message.sticker
    return Sticker.new(stiker) if stiker

    false
  end

  # +Optional.+ Message is a Video, information about the video.
  def video
    vd = @message.video
    return Video.new(vd) if vd

    false
  end

  # +Optional.+ Message is a VideoNote, information about the video message.
  def video_note
    vnot = @message.video_note
    return VideoNote.new(vnot) if vnot

    false
  end

  # +Optional+. message is a Voice message, information about the file.
  def voice
    vc = @message.voice
    return Voice.new(vc) if vc

    false
  end

  # +Optional+. Caption for the animation, audio, document, photo, video
  # or voice, 0-1024 characters.
  def caption
    @message.caption
  end

  # +Optional.+ For messages with a caption, special entities like 
  # usernames, URLs, bot commands, etc. that appear in the caption.
  def caption_entities
    c_entitys = @message.caption_entities
    if c_entitys.empty?
      return false
    end

    ary_ent = []
    c_entitys.each do |ent|
      ary_ent << MessageEntity.new(ent)
    end
    ary_ent
  end

  # +Optional+. Message is a shared contact, information about the contact.
  def contact
    kontakt = @message.contact
    return Contact.new(kontakt) if kontakt

    false
  end

  # +Optional+. Message is a Dice with random value from 1 to 6.
  def dice
    dis = @message.dice
    return Dice.new(dis) if dis

    false
  end

  # +Optional+. Message is a Game, information about the game.
  def game
    gam = @message.game
    return Game.new(gam) if gam

    false
  end

  def text_msg?
    text ? true : false
  end

  # returns true if the update is for replied msg
  def reply_msg?
    @message.reply_to_message ? true : false
  end

  def video_msg?
    @message.video ? true : false
  end

  def audio_msg?
    @message.audio ? true : false
  end

  def document_msg?
    @message.document ? true : false
  end

  def contact_msg?
    @message.contact ? true : false
  end

  def forward_msg?
    (@update.forward_from) or (@update.forward_from_chat) ? true : false
  end

  def animation_msg?
    @message.animation ? true : false
  end

  def photo_msg?
    @message.photo.empty? ? false : true
  end

  def voice_msg?
    @message.voice ? true : false
  end

  def video_note_msg?
    @message.video_note ? true : false
  end

  def sticker_msg?
    @message.sticker ? true : false
  end

  def game_msg?
    @message.game ? true : false
  end

  def poll_msg?
    @message.poll ? true : false
  end

  def venue_msg?
    @message.venue ? true : false
  end

  def location_msg?
    @message.location ? true : false
  end

  def new_chat_member?
    @message.new_chat_member ? true : false
  end

  def left_chat_member?
    @message.left_chat_member ? true : false
  end

  def new_chat_title?
    @message.new_chat_title ? true : false
  end

  def new_chat_photo?
    @message.new_chat_photo ? true : false
  end

  def pinned_msg?
    @message.pinned_message ? true : false
  end

  def delete_chat_photo?
    @message.delete_chat_photo ? true : false
  end

  def reply_markup?
    @message.reply_markup ? true : false
  end

  def forward_from_chat?
    @message.forward_from_chat ? true : false
  end

  def has_entities?
    @message.entities.empty? ? false : true
  end
end

# ughhhhh God!
