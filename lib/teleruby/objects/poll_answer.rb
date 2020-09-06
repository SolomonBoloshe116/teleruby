#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'user'

# +Sunday,+ +August+ +23+ +2020+

# ===This object represents an answer of a user in a non-anonymous poll.
class PollAnswer
  def initialize(poll) # :nodoc:
    @poll = poll
  end

  # Unique poll identifier.
  def poll_id
    @poll.poll_id
  end

  # The user, who changed the answer to the poll. Return User object
  def user
    User.new(@poll.user)
  end

  # 0-based identifiers of answer options, chosen by the user.
  # May be empty if the user retracted their vote.
  def option_ids
    @poll.option_ids
  end
end
