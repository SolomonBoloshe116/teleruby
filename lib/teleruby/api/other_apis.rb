#!/usr/bin/ruby
# frozen_string_literal: true

require_relative '../core_api'

module Telegram
  module OtherApis
    ##
    # Use this method to forward messages of any kind.
    def forward_message(from_chat_id, to_chat_id, message_id, params = {})
      hash = { chat_id: to_chat_id, from_chat_id: from_chat_id }
      hash2 = { message_id: message_id }.merge!(params)
      hash.merge!(hash2)
      data = post('forwardMessage', hash)
      unless data.ok # rubocop:disable Style/IfUnlessModifier
        fail TelegramError, data.description
      end
      data.result
    end

    ##
    # Use this method to kick a user from a group, a supergroup
    # or a channel.
    def kick_chat_member(chat_id, user_id, params = {})
      hash = { chat_id: chat_id, user_id: user_id }.merge!(params)
      data = post('kickChatMember', hash)
      unless data.ok # rubocop:disable Style/IfUnlessModifier
        fail TelegramError, data.description
      end
      data.result
    end

    ##
    # Use this method to unban a previously kicked user in a
    # supergroup or channel.
    def unban_chat_member(chat_id, user_id)
      hash = { chat_id: chat_id, user_id: user_id }
      data = post('unbanChatMember', hash)
      unless data.ok # rubocop:disable Style/IfUnlessModifier
        fail TelegramError, data.description
      end
      data.result
    end

    ##
    # Use this method to restrict a user in a supergroup.
    def restrict_chat_member(chat_id, user_id, permissions, params = {})
      hash = { chat_id: chat_id, user_id: user_id }
      hash2 = { permissions: permissions }
      hash.merge!(hash2)
      data = post('restrictChatMember', hash)
      unless data.ok # rubocop:disable Style/IfUnlessModifier
        fail TelegramError, data.description
      end
      data.result
    end

    ##
    # Use this method to promote or demote a user in a supergroup or
    # a channel.
    def promote_chat_member(chat_id, user_id, params = {})
      hash = { chat_id: chat_id, user_id: user_id }.merge!(params)
      data = post('promoteChatMember', hash)
      unless data.ok # rubocop:disable Style/IfUnlessModifier
        fail TelegramError, data.description
      end
      data.result
    end

    ##
    # Use this method to generate a new invite link for a chat.
    def export_chat_link(chat_id)
      hash = { chat_id: chat_id }
      response = post('exportChatInviteLink', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail TelegramError, response.description
      end
      response.result
    end

    ##
    # Use this method to pin a message in a group, a supergroup,
    # or a channel.
    def pin_chat_message(chat_id, message_id, params = {})
      hash = { chat_id: chat_id, message_id: message_id }.merge!(params)
      response = post('pinChatMessage', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail SecurityError, response.description
      end
      response.result
    end

    ##
    # Use this method to stop a poll which was sent by the bot.
    def stop_poll(chat_id, message_id, params = {})
      hash = { chat_id: chat_id, message_id: message_id }.merge!(params)
      response = post('stopPoll', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail Error, response.description
      end
      response.result
    end

    ##
    # Use this method to upload a .PNG file with a sticker for later use
    # in createNewStickerSet and addStickerToSet methods
    # (can be used multiple times).
    def upload_sticker_file(user_id, png_sticker)
      hash = { user_id: user_id, png_sticker: png_sticker }
      response = post('uploadStickerFile', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail Error, response.description
      end
      response.result
    end

    ##
    # Use this method to create a new sticker set owned by a user.
    # The bot will be able to edit the sticker set thus created.
    # You must use exactly one of the fields png_sticker or tgs_sticker.
    def create_new_stricker_set(user_id, name, title, params = {})
      hash = { user_id: user_id, name: name, title: title }.merge!(params)
      response = post('createNewStickerSet', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail Error, response.description
      end
      response.result
    end

    ##
    # Use this method to add a new sticker to a set created by the bot.
    def add_sticker_to_set(user_id, name, emojis, params = {})
      hash = { user_id: user_id, name: name, emojis: emojis }.merge!(params)
      response = post('addStickerToSet', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        throw StandardError, response.description
      end
      response.result
    end

    def edit_message_live_location
      fail NotImplementedError, 'not implemented'
    end

    ##
    # Use this method to send answers to callback queries sent from inline
    # keyboards. The answer will be displayed to the user as a notification
    # at the top of the chat screen or as an alert. On success, True is
    # returned.
    def answer_callback_query(callback_query_id, params = {})
      hash = { callback_query_id: callback_query_id }.merge!(params)
      response = post('answerCallbackQuery', hash)
      unless response.ok
        raise FatalError, response.description
      end
      response.result
    end

    def delete_webhook
      fail NotImplementedError, 'not support for now'
    end

    ##
    # Use this method to edit text and game messages. On success,
    # if edited message is sent by the bot, the edited Message is returned,
    # otherwise True is returned.
    def edit_message_text(text, params = {})
      hash = { text: text }.merge!(params)
      response = post('editMessageText', hash)
      unless response.ok
        fail FatalError, response.description
      end
      if response.result == true
        return true
      end
      Message.new(response.result)
    end

    ##
    # Use this method to edit captions of messages. On success, if edited
    # message is sent by the bot, the edited Message is returned, otherwise
    # True is returned.
    def edit_message_caption(params = {})
      response = post('editMessageCaption', params)
      unless response.ok
        fail FatalError, response.description
      end
      if response.result == true
        return true
      end
      Message.new(response.result)
    end

    ##
    # Use this method to edit animation, audio, document, photo, or video
    # messages. If a message is a part of a message album, then it can be
    # edited only to a photo or a video. Otherwise, message type can be
    # changed arbitrarily. When inline message is edited, new file can't
    # be uploaded. Use previously uploaded file via its file_id or specify
    # a URL. On success, if the edited message was sent by the bot, the edited
    # Message is returned, otherwise True is returned.
    def edit_message_media(media, params = {})
      hash = { media: media }.merge!(params)
      response = post('editMessageMedia', hash)
      unless response.ok
        fail FatalError, response.description
      end
      if response.result == true
        return true
      end
      Message.new(response.result)
    end

    ##
    # Use this method to edit only the reply markup of messages. 
    # On success, if edited message is sent by the bot, the edited Message
    # is returned, otherwise True is returned.
    def edit_message_reply_markup(params = {})
      response = post('editMessageReplyMarkup', params)
      unless response.ok
        fail FatalError, response.description
      end
      if response.result == true
        return true
      end
      Message.new(response.result)
    end

    ##
    # Use this method to send answers to an inline query. On success, True
    # is returned. No more than 50 results per query are allowed.
    def answer_inline_query(inline_query_id, result, params = {})
      hash = { inline_query_id: inline_query_id, result: result }.merge!(params)
      response = post('answerInlineQuery', hash)
      unless response.ok
       fail FatalError, response.description
      end
      response.result
    end
  end
end
