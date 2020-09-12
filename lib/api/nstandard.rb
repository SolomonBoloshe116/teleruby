#!/usr/bin/ruby
# frozen_string_literal: true

require 'open-uri'

module Telegram
  module NonStandard
    def download_file(file_d, dir = Dir.pwd)
      raise NotImplementedError, 'not implemented'
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
