#!/usr/bin/ruby
# frozen_string_literal: true

begin
  require 'faraday'
  f = true
  require 'json'
  j = true
rescue LoadError
  puts 'some gems are not installed'
  print 'should i install them?(y/n):'
  ans = gets.chomp!
  unless (ans.eql? 'y') or (ans.eql? 'Y')
    puts 'okay bye'
    exit 0
  end
  if !f
    Gem.install 'faday'
  elsif !j
    Gem.install 'json'
  end
end

require_relative 'objects/all'

class Hash
  def method_missing(method_name)
    self[method_name.to_s]
  end
end

module Telegram
  class TGClient
    @@base_uri = %q{https://api.telegram.org/bot}
    @@file_uri = %q{https://api.telegram.org/file/bot}
    # == Post
    # method to submit data to telegram server
    def post(method, params = {})
      body = Faraday.post(@@base_uri + @token + '/' + method, params).body
      JSON.parse(body)
    end

    # == Get
    # method to get data from telegram server
    def get(method, params = {})
      body = Faraday.get(@@base_uri + @token + '/' + method, params).body
      JSON.parse(body)
    end

    protected :post, :get
  end
end
