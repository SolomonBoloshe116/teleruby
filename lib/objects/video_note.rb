#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'photo_size'

##
# +Monday+, +August+ +24+ +2020+ +EAT+
# ===This object represents a video message
# (available in Telegram apps as of v.4.0).
class VideoNote
  def initialize(obj) # :nodoc:
    @note = obj
  end

  # Identifier for this file, which can be used to download or reuse the file.
  def file_id
    @note.file_id
  end

  # Unique identifier for this file, which is supposed to be the same over
  # time and for different bots. Can't be used to download or reuse the file.
  def file_unique_id
    @note.file_unique_id
  end

  # Video width and height (diameter of the video message) as defined by sender.
  def length
    @note.length
  end

  # Duration of the video in seconds as defined by sender.
  def duration
    @note.duration
  end

  # +Optional+. File size
  def file_size
    @note.file_size
  end

  # +Optional+. Video thumbnail. Returns PhotoSize object.
  def thumb
    data = @note.thumb
    return false unless data
 
    PhotoSize.new(data)
  end
end
