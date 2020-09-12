#!/usr/bin/ruby
# frozen_string_literal: true

##
# +Monday,+ +August+ +24+ 2020+ +EAT+
# ===This object contains information about one answer option in a poll.
class PollOption
  def initialize(poll) # :nodoc:
    @poll = poll
    freeze
  end

  # +Option+ text, 1-100 characters.
  def text
    @poll.text
  end

  # Number of users that voted for this option.
  def voter_count
    @poll.voter_count
  end
end
