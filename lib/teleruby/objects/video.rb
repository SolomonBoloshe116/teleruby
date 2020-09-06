#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'same/common_2'
require_relative 'photo_size'

##
# ===This object represents a video file.
# Extends Common2 class.
class Video < Common2
  def initialize(obj) # :nodoc:
    super(obj)
  end

  # Video width as defined by sender.
  def width
    @obj.width
  end

  # Video height as defined by sender.
  def heigth
    @obj.heigth
  end

  # Duration of the video in seconds as defined by sender.
  def duration
    @obj.duration
  end

  # +Optional+. Video thumbnail.
  def thumb
    data = @obj.thumb
    unless data
      return PhotoSize.new(data)
    end

    false
  end
end
