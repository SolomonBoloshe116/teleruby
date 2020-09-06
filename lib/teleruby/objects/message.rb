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
    unless frm.nil?
      return User.new(frm)
    end

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
    unless f_from.nil?
      return User.new(f_from)
    end

    false
  end

  # +Optional.+ For messages forwarded from channels, information about
  # the original channel.
  # Returns Chat object.
  def forward_from_chat
    ff_chat = @message.forward_from_chat
    unless ff_chat.nil?
      return Chat.new(ff_chat)
    end

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
    unless r_t_msg.nil?
      return Message.new(r_t_msg)
    end

    false
  end

  # +Optional+. Bot through which the message was sent.
  # Returns User object.
  def via_bot
    v_bot = @message.via_bot
    unless v_bot.nil?
      return User.new(v_bot)
    end

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
    empty_entity = []
    entitys = @message.entities
    unless entitys.empty?
      entitys.each do |ent|
        empty_entity << MessageEntity.new(ent)
      end
      return empty_entity
    end

    false
  end

  # +Optional.+ Message is an animation, information about the animation.
  # For backward compatibility, when this field is set, the document
  # field will also be set.
  # Returns Animation object
  def animation
    an = @message.animation
    unless an.nil?
      return Animation.new(an)
    end

    false
  end

  # +Optional+. message is an Audio file, information about the file.
  def audio
    ad = @message.audio
    if ad
      return Audio.new(ad)
    end

    false
  end

  # +Optional+. message is a general file, information about the file.
  # Returns Document object.
  def document
    doc = @message.document
    unless doc.nil?
      return Document.new(doc)
    end

    false
  end

  # +Optional+. message is a Photo, available sizes of the photo.
  # returns array of PhotoSize object
  def photo
    poto = @message.photo
    e_photo = []
    unless poto.empty?
      poto.each do
        e_photo << PhotoSize.new(e_photo)
      end
      return e_photo
    end
 
    false
  end

  # +Optional.+ Message is a sticker, information about the sticker
  # returns Sticker object
  def sticker
    stiker = @message.sticker
    unless stiker.nil?
      return Sticker.new(stiker)
    end

    false
  end

  # +Optional.+ Message is a Video, information about the video.
  def video
    vd = @message.video
    unless vd.nil?
      return Video.new(vd)
    end

    false
  end

  # +Optional.+ Message is a VideoNote, information about the video message.
  def video_note
    vnot = @message.video_note
    unless vnot.nil?
      return VideoNote.new(vnot)
    end

    false
  end

  # +Optional+. message is a Voice message, information about the file.
  def voice
    vc = @message.voice
    unless vc.nil?
      return Voice.new(vc)
    end

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
    empty_ent = []
    unless c_entitys.empty?
      c_entitys.each do |ent|
        empty_ent << MessageEntity.new(ent)
      end
      return empty_ent
    end

    false
  end

  # +Optional+. Message is a shared contact, information about the contact.
  def contact
    kontakt = @message.contact
    unless kontakt.nil?
      return Contact.new(kontakt)
    end

    false
  end

  # +Optional+. Message is a Dice with random value from 1 to 6.
  def dice
    dis = @message.dice
    unless dis.nil?
      return Dice.new(dis)
    end

    false
  end

  # +Optional+. Message is a Game, information about the game.
  def game
    gam = @message.game
    unless gam.nil?
      return Game.new(gam)
    end

    false
  end

  def text_msg?
    !text.nil?
  end

  # returns true if the update is for replied msg
  def reply_msg?
    !@message.reply_to_message.nil?
  end

  def video_msg?
    !@message.video.nil?
  end

  def audio_msg?
    !@message.audio.nil?
  end

  def document_msg?
    !@message.document.nil?
  end

  def contact_msg?
    !@message.contact.nil?
  end

  def forward_msg?
    !(@update.forward_from) || (@update.forward_from_chat).nil?
  end

  def animation_msg?
    !@message.animation.nil?
  end

  def photo_msg?
    !(@message.photo).empty?
  end

  def voice_msg?
    !@message.voice.nil?
  end

  def video_note_msg?
    !@message.video_note.nil?
  end

  def sticker_msg?
    !@message.sticker.nil?
  end

  def game_msg?
    !@message.game.nil?
  end

  def poll_msg?
    !@message.poll.nil?
  end

  def venue_msg?
    !@message.venue.nil?
  end

  def location_msg?
    !@message.location.nil?
  end

  def new_chat_member?
    !@message.new_chat_member.nil?
  end

  def left_chat_member?
    !@message.left_chat_member.nil?
  end

  def new_chat_title?
    !@message.new_chat_title.nil?
  end

  def new_chat_photo?
    !@message.new_chat_photo.nil?
  end

  def pinned_msg?
    !@message.pinned_message.nil?
  end

  def delete_chat_photo?
    !@message.delete_chat_photo.nil?
  end

  def reply_markup?
    !@message.reply_markup.nil?
  end
end

# ughhhhh God!
