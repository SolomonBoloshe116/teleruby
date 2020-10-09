#!/usr/bin/ruby
# frozen_string_literal: true

require 'open-uri'
require_relative '../core_api'

module Telegram
  module NonStandard
    include CoreApi
    def download_file(file_d, dir = Dir.pwd)
      d = Dir.new(dir)
    end

    def download_file_from(uri, dir = Dir.pwd)
      uri = URI.parse(uri)
      
    end

    # use 'markdown'
    def create_user_link(name, user_id)
      "[#{name}](tg://user?id=#{id})"
    end

    # use 'markdow' for parse_mode
    def create_text_link(message, url)
      "[#{message}](#{url})"
    end
  end
end
