#!/usr/bin/ruby
# frozen_string_literal: true

require_relative '../core_api'

# Solomon Boloshe(Lee Crey)
# Friday, August 21 2020 05:35:05 PM +0300

module Telegram
  module SendApis # rubocop:disable Metrics/ModuleLength
    include CoreApi
    # Use this method to send text messages.
    def send_message(chat_id, text, params = {})
      hash = { chat_id: chat_id, text: text }.merge!(params)
      response = http_post('sendMessage', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail FatalError, response.description
      end
      Message.new(response.result)
    end

    # Use this method to send photos.
    def send_photo(chat_id, photo, params = {})
      hash = { chat_id: chat_id, photo: photo }.merge!(params)
      response = http_post('sendPhoto', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail FatalError, response.description
      end
      Message.new(response.result)
    end

    # Use this method to send audio files.
    def send_audio(chat_id, audio, params = {})
      hash = { chat_id: chat_id, audio: audio }.merge!(params)
      response = http_post('sendAudio', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail FatalError, response.description
      end
      Message.new(response.result)
    end

    # Use this method to send general files.
    def send_document(chat_id, document, params = {})
      hash = { chat_id: chat_id, document: document }.merge!(params)
      response = http_post('sendDocument', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail FatalError, response.description
      end
      Message.new(response.result)
    end

    # Use this method to send video files, Telegram clients support
    # mp4 videos (other formats may be sent as Document).
    def send_video(chat_id, video, params = {})
      hash = { chat_id: chat_id, video: video }.merge!(params)
      response = http_post('sendVideo', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
         fail FatalError, response.description
      end
      Message.new(response.result)
    end

    # Use this method to send animation files (GIF or H.264/MPEG-4
    # AVC video without sound).
    def send_animation(chat_id, animation, params = {})
      hash = { chat_id: chat_id, animation: animation }.merge!(params)
      response = http_post('sendAnimation', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail FatalError, response.description
      end
      Message.new(response.result)
    end

    # Use this method to send voice file
    def send_voice(chat_id, voice, params = {})
      hash = { chat_id: chat_id, voice: voice }.merge!(params)
      response = http_post('sendVoice', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail FatalError, response.description
      end
      Message.new(response.result)
    end

    # Use this methods to send video note file
    def send_video_note(chat_id, video_note, params = {})
      hash = { chat_id: chat_id, video_note: video_note }.merge!(params)
      response = http_post('sendVideoNote', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail FatalError, response.description
      end
      Message.new(response.result)
    end

    # Use this method to send a group of photos or videos as an album.
    def send_media_group(chat_id, media, params = {})
      hash = { chat_id: chat_id, media: media }.merge!(params)
      response = http_post('sendMediaGroup', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail FatalError, response.description
      end
      Message.new(response.result)
    end

    # Use this method to send point on the map.
    def send_location(chat_id, latitude, longitude, params = {})
      hash = { chat_id: chat_id, latitude: latitude, longitude: longitude}
      hash.merge!(params)
      response = http_post('sendLocation', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail FatalError, response.description
      end
      Message.new(response.result)
    end

    # Use this method to send information about a venue.
    def send_venue(chat_id, latitude, longitude, title, address, params = {})
      hash = { chat_id: chat_id, latitude: latitude, longitude: longitude }
      hash2 = { title: title, address: address}.merge!(params)
      hash.merge!(hash2)
      response = http_post('sendVenue', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        throw FatalError, response.description
      end
      Message.new(response.result)
    end

    # Use this method to send phone contacts.
    def send_contact(chat_id, phone_number, first_name, params = {})
      hash = { chat_id: chat_id, phone_number: phone_number }
      hash2 = { first_name: first_name }.merge!(params)
      hash.merge!(hash2)
      response = http_post('sendContact', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail FatalError, response.description
      end
      Message.new(response.result)
    end

    # Use this method to send a native poll.
    def send_poll(chat_id, question, options, params = {})
      hash = { chat_id: chat_id, question: question }
      hash2 = { options: options }.merge!(params)
      hash.merge!(hash2)
      response = http_post('sendPoll', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail FatalError, response.description
      end
      Message.new(response.result)
    end

    # Use this method to send an animated emoji that will display a 
    # random value.
    def send_dice(chat_id, params = {})
      hash = { chat_id: chat_id}.merge!(params)
      response = http_post('sendDice', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail FatalError, response.description
      end
      Message.new(response.description)
    end

    # Use this methods to send chat actions
    # actions may be typing upload_photo record_video upload_video
    # upload_audio upload_document find_location record_video_note
    # upload_video_note 
    def send_chat_action(chat_id, action) # rubocop:disable: Metrics/MethodLength
       actions = %w{ typing upload_photo record_video upload_video
       upload_audio upload_document find_location record_video_note
       upload_video_note }
       unless actions.include? action # rubocop:disable Style/IfUnlessModifier
         throw Error, 'invalid chat action'
       end
       hash = { chat_id: chat_id, action: action }
       response = http_post('sendChatAction', hash)
       unless response.ok # rubocop:disable Style/IfUnlessModifier
         fail IdError, 'incorrect chat id'
       end
       response.result
    end

    # Use this method to send sticker file
    def send_sticker(chat_id, file, params = {})
      hash = { chat_id: chat_id, sticker: file }.merge!(params)
      response = http_post('sendSticker', hash)
      unless response.ok # rubocop:disable Style/IfUnlessModifier
        fail FatalError, response.description
      end
      Message.new(response.result)
    end
  end
end
