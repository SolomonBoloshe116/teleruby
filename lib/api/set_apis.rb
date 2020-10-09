#!/usr/bin/ruby
# frozen_string_literal: true

require_relative '../core_api'

# Solomon Boloshe(Lee Crey)
# Friday, August 21 2020 06:35:33 PM +0300

module Telegram
  module SetApis # rubocop:disable Metrics/ModuleLength
    include CoreApi
    # Use this method to set a custom title for an administrator
    # in a supergroup promoted by the bot.
    def set_cutom_title(chat_id, user_id, title)
      if chat_id.to_i.negative?
        fail BadRequestError, 'can\' set custom title for private chat'
      end
      hash = { chat_id: chat_id, user_id: user_id, custom_title: title }
      response = http_post('setChatAdministratorCustomTitle', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail PermissionError, response.description
      end
      response.result
    end

    def set_chat_permissions(chat_id, permissions)
      unless chat_id.to_i.negative?
        fail BadRequestError, 'can\' set permissions for private chat'
      end
      hash = { chat_id: chat_id, permissions: permissions }
      response = http_post('setChatPermissions', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail PermissionError, response.description
      end
      response.result
    end

    # Use this method to set a new profile photo for the chat.
    # Photos can't be changed for private chats.
    def set_chat_photo(chat_id, file)
      unless chat_id.to_i.negative?
        fail BadRequestError, 'can\'t set photo for private chat'
      end
      hash = { chat_id: chat_id, photo: file }
      data = http_post('setChatPhoto', hash)
      unless data.ok # rubocop:disable Style/IfUnlessModifier
        fail PermissionError, data.description
      end
      data.result
    end

    # Use this method to change the title of a chat.
    # Titles can't be changed for private chats.
    def set_chat_title(chat_id, title)
      unless chat_id.to_i.negative?
        fail BadRequestError, 'can\'t set chat title for private'
      end

      hash = { chat_id: chat_id, title: title.to_s }
      data = http_post('setChatTitle', hash)
      unless data.ok # rubocop:disable Style/IfUnlessModifier
        throw PermissionError, data.description
      end

      data.result
    end

    # Use this method to change the description of a group,
    # a supergroup or a channel.
    def set_chat_description(chat_id, description)
      unless chat_id.to_i.negative?
        fail BadRequestError, 'can\'t set description for private chat'
      end

      hash = { chat_id: chat_id, description: description }
      data = http_post('setChatDescription', hash)
      unless data.ok # rubocop:disable Style/IfUnlessModifier
        fail PermissionError, data.description
      end

      data.result
    end

    # Use this method to set a new group sticker set for a supergroup.
    def set_chat_sticker_set(chat_id, set_name)
      hash = { chat_id: chat_id, set_name: set_name }
      data = http_post('setChatStickerSet', hash)
      unless data.ok # rubocop:disable Style/IfUnlessModifier
        fail StandardError, data.description
      end
      data.result
    end

    # Use this method to change the list of the bot's commands.
    def set_my_command(command)
      hash = { command: command }
      data = http_post('setMyCommand', hash)
      unless data.ok # rubocop:disable Style/IfUnlessModifier
        fail TokenError, data.description
      end
      data.result
    end

    # Use this method to move a sticker in a set created by the bot
    # to a specific position. position must be int value
    def set_sticker_position_in_the_set(sticker, position)
      hash = { sticker: sticker, position: position }
      data = http_post('setStickerPositionInTheSet', hash)
      unless data.ok # rubocop:disable Style/IfUnlessModifier
        fail Error, data.description
      end
      data.result
    end

    # Use this method to set the thumbnail of a sticker set.
    def set_sticker_set_thumb(name, user_id, params = {})
      hash = { name: name, user_id: user_id }.merge!(params)
      data = http_post('setStickerSetThumb', hash)
      unless data.ok # rubocop:disable Style/IfUnlessModifier
        fail Error, data.description
      end
      data.result
    end

    def set_webhook(url, params = {})
      fail NotImplementedError, 'not implemented'
    end
  end
end
