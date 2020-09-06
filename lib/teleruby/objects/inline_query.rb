#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'user'
require_relative 'location'

# This object represents an incoming inline query. When the user sends
# an empty query, your bot could return some default or trending results.
class InlineQuery
  def initialize(query) # :nodoc:
    @query = query
  end

  # Unique identifier for this query
  def id
    @query.id
  end

  # Sender.
  # User object
  def from
    User.new(@query.from)
  end

  # +Optional+. Sender location, only for bots that request user location,
  def location
    lcation = @query.location
    unless lcation.nil?
      return Location.new(lcation)
    end

    false
  end

  # Text of the query (up to 256 characters)
  def query
    @query.query
  end

  # Offset of the results to be returned, can be controlled by the bot.
  def offset
    @query.offset
  end
end
