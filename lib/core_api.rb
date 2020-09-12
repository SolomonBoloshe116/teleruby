#!/usr/bin/ruby

require 'faraday'
require 'json'
require_relative 'objects/all'

module Telegram
  class Error < StandardError; end

  # Raise when chat_id, and user_id are incorrect,
  class IdError < Error; end

  # Raise when bot token is incorrect.
  class TokenError < Error; end

  # Raise when bot has not appropriate admin right in supergroups.
  class PermissionError < Error; end

  # Raise when one of optional parameters is incorrect and telegram
  # unalbe to do the requested operation.
  class TelegramError < Error; end

  class FatalError < Error; end
  class BadRequestError < Error; end
  class UndefinedMethod < Error; end

  module CoreApi
    @@base_uri = %q{https://api.telegram.org/bot}
    @@file_uri = %q{https://api.telegram.org/file/bot} # to download files

    def http_get(method, params = {})
      body = Faraday.post(@@base_uri + @token + '/' + method, params).body
      JSON.parse(body)
    end

    def http_post(method, params = {})
      body = Faraday.post(@@base_uri + @token + '/' + method, params).body
      JSON.parse(body)
    end
  end
end
