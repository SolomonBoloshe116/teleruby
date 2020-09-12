#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'same/common'

##
# +Monday,+ +August+ +24+ +2020+
# ===This object represents one size of a photo or a file/sticker thumbnail.
# Extends Common class.
class PhotoSize < Common
  def initialize(photo) # :nodoc:
    super(photo)
  end
end
