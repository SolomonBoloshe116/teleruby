#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'teleruby/all_apis'

##
# @lee_crey (Solomon Boloshe)
#
# @teleruby_support

module Telegram
  # Generic exception class.
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

  # === Bot class
  class Client < TGClient
    include AllApis
    def initialize(token: token)
      @token = token
      @last_update = 0
    end

    # for getting updates
    # long polling
    def run!(&block)
      (fail LocalJumpError, 'block is not given' unless block_given?)
      loop do
        block.call
      end
    end
  end
end

