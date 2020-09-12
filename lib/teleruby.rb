#!/usr/bin/ruby

require_relative 'api/all'

module Telegram
  # Telegram CLient(bot)
  class Client
    include AllApis
    def initialize(token: )
      @token = token
      @last_update = 0
    end
  end
end
