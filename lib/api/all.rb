#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'delete_apis'
require_relative 'get_apis'
require_relative 'nstandard'
require_relative 'other_apis'
require_relative 'send_apis'
require_relative 'set_apis'

module Telegram
    module AllApis
        include DeleteApis
        include GetApis
        include NonStandard
        include OtherApis
        include SendApis
        include SetApis
    end
end