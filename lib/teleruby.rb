#!/usr/bin/ruby

require 'require_all'
require_all 'api'

module Telegram
  # Telegram CLient(bot)
  class Client
    include DeleteApis
    include GetApis
    include NonStandard
    include OtherApis
    include SendApis SetApis
    def initialize(token: )
      @token = token
      @last_update = 0
    end
  end
end
