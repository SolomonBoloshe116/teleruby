#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'photo_size'
require_relative 'same/common'

##
# +Sunday+, +August+ +23+ +2020+
# ===This object represents an animation file.
# (GIF or H.264/MPEG-4 AVC video without sound).
class Animation < Common
  def initialize(obj) # :nodoc:
    super(obj)
    freeze
  end

  # Duration of the video in seconds as defined by sender.
  def duration
    @obj.duration
  end

  # +Optional+. Original animation filename as defined by sender.
  def file_name
    @obj.file_name
  end

  # +Optional.+ MIME type of the file as defined by sender.
  def mime_type
    @obj.mime_type
  end

  def thumb
    data = @obj.thumb
    return PhotoSize.new(data) if data

    false
  end
end
