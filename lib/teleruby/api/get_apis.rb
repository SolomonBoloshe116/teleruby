#!/usr/bin/ruby
# frozen_string_literal: true

require_relative '../core_api'

# Solomon Boloshe(Lee Crey)
# Friday, August 21 2020 04:52:49 PM +0300

module Telegram
  module GetApis # rubocop:disable Metrics/ModuleLength
    # Use this method to receive incoming updates using long polling.
    def get_updates(limit = 10, &block) # rubocop:disable Metrics/MethodLength
      blok = {}
      if block_given?
        blok = block.call
        unless blok.instance_of? Hash # rubocop:disable Style/IfUnlessModifier
          fail ArgumentError, 'expected object is hash'
        end
      end

      hash = { 'timeout': 0, 'limit': limit, 'offset': @last_update }
      hash.merge!(blok)
      response = get('getUpdates', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail TelegramError, response.desciption
      end

      result = response.result
      if result.instance_of? Array
        @last_update = result[-1]['update_id'] + 1 unless result[-1].nil?
      end

      updates = []
      result.each do |update|
        updates << Update.new(update)
      end
      updates
    end
    # rubocop:enalbe Metrics/MethodLength

    # A simple method for testing your bot's authentication token.
    def get_me
      response = get('getMe')
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail TokenError, 'incorrect bot token'
      end
      BotUser.new(response.result)
    end

    # Use this method to get basic info about a file.
    # Returns TFile object
    def get_file(file_id)
      hash = { file_id: file_id }
      response = get('getFile', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail IdError, 'incorrect file id'
      end
      TFile.new(response.result)
    end

    # Use this method to get a list of profile pictures for a user.
    def get_profile_photos(user_id, params = {}) # rubocop:disable Metrics/MethodLength
      if user_id.to_i.negative? # rubocop:disable Style/IfUnlessModifier
        fail IdError, 'id must be private chat\'s id'
      end

      hash = { uesr_id: user_id }.merge!(params)
      response = get('getProfilePhotos', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fails TelegramError, response.description
      end

      result = response.result
      if result.instance_of? Array
        profile = []
        result.each do |e|
          profile << ProfilePhoto.new(e)
        end
        return profile
      end
      ProfilePhoto.new(result)
    end

    # Use this method to get a list of administrators in a chat.
    def get_chat_admins(chat_id)
      unless chat_id.to_i.negative? # rubocop:disable Style/IfUnlessModifier
        fail IdError, 'chat id must be supergroup id'
      end
      hash = { chat_id: chat_id }
      response = get('getChatAdministrators', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail FatalError, 'fatal error'
      end

      result = response.result
      users = []
      result.each do |user|
        users << ChatMember.new(user)
      end
      users
    end
    # rubocop:enable Metrics/MethodLength

    # Use this method to get the number of members in a chat.
    def get_chat_members_count(chat_id)
      hash = { chat_id: chat_id }
      response = get('getChatMemebersCount', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        raise IdError, 'don\'t use private chat id'
      end
      response.result
    end

    # Use this method to get information about a member of a chat.
    def get_chat_member(chat_id, user_id)
      hash = { chat_id: chat_id, user_id: user_id }
      response = get('getChatMember', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail FatalError, response.description
      end
      ChatMember.new(response.result)
    end

    # Use this method to get a sticker set.
    def get_sticker_set_name(name)
      hash = { name: name }
      response = get('getStickerSetName', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail Error, 'incorrect sticker set name'
      end
      StickerSet.new(response.result)
    end

    # Use this method to get up to date information about the chat.
    def get_chat(chat_id) # rubocop:disable Metrics/MethodLength
      hash = { chat_id: chat_id }
      response = get('getChat', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail IdError, 'incorrect chat id'
      end

      if chat_id.negative?
        return GetChat.new(response.result)
      end
      PrivateChat.new(response.result)
    end

    # Use this method to get the current list of the bot's commands.
    def get_my_commands # rubocop:disable Metrics/MethodLength
      response = get('getMyCommands')
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail TokenError, 'seems token error'
      end

      commands = []
      result = response.result
      result.each do |command|
        commands << BotCommand.new(command)
      end
      commands
    end
  end
  # rubocop:enable Metrics/MethodLength

  # The End!
end
