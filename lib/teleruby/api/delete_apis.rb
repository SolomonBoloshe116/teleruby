#!/usr/bin/ruby
# frozen_string_literal: true

require_relative '../core_api'

module Telegram
  module DeleteApis
    # Use this method to delete a chat photo.
    def delete_chat_photo(chat_id)
      unless chat_id.to_i.negative?
        fail BadRequestError, 'can\' delete private chat photo'
      end

      hash = { chat_id: chat_id }
      response = post('deleteChatPhoto', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail PermissionError, response.description
      end

      response.result
    end

    # Use this method to delete a group sticker set from a supergroup.
    def delete_chat_sticker_set(chat_id)
      unless chat_id.to_i.negative?
        fail BadRequestError, 'can\' delete sticker set of private chat'
      end

      hash = { chat_id: chat_id }
      response = post('deleteChatStickerSet', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail PermissionError, response.description
      end

      response.result
    end

    # Use this method to delete a message, including service messages.
    def delete_message(chat_id, message_id)
      hash = { chat_id: chat_id, message_id: message_id }
      response = post('deleteMessage', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail TelegramError, response.description
      end

      response.result
    end

    # Use this method to delete a sticker from a set created by the bot.
    def delete_sticker_from_set(sticker)
      throw NotImplementedError, 'currently not supported'
    end
  end
end
