#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'same/common_2'

##
# +Monday+, +August+ +24+ +2020+ +EAT+
# ===This object represents a voice note.
# Extends Common2 class.

class Voice < Common2
  def initialize(obj) # :nodoc:
    super(obj)
  end

  # Duration of the audio in seconds as defined by sender.
  def duration
    @obj.duration
  end
end
