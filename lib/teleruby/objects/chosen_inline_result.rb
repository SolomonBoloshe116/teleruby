#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'user'
require_relative 'location'

# ===Represents a result of an inline query that was chosen by the user
# ====and sent to their chat partner.
class ChoseInlineResult
  def initialize(result) # :nodoc:
    @result = result
  end

  # The unique identifier for the result that was chosen.
  def result_id
    @result.result_id
  end

  # The user that chose the result.
  def from
    User.new(@result.from)
  end

  # +Optional+. Sender location, only for bots that require user location.
  def location
    lcation = @result.location
    unless lcation.nil?
      return Location.new(lcation)
    end
  
    false
  end

  # +Optional.+ Identifier of the sent inline message. Available only if
  # there is an inline keyboard attached to the message. Will be also 
  # received in callback queries and can be used to edit the message.
  def inline_message_id
    @result.inline_message_id
  end

  # The query that was used to obtain the result.
  def query
    @result.query
  end
end
