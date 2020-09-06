#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'same/common_2'
require_relative 'photo_size'

##
# +Monday,+ +August+ +24+ +2020+
# ===This object represents an audio file to be treated as music by the Telegram clients.
class Audio < Common2
  def initialize(audio) # :nodoc:
    super(audio)
  end

  # Duration of the audio in seconds as defined by sender.
  def duration
    @obj.duration
  end

  # +Optional.+ Performer of the audio as defined by sender or by audio tags.
  def performer
    @obj.performer
  end

  # +Optional+. Title of the audio as defined by sender or by audio tags
  def title
    @obj.title
  end

  # +Optional.+ Thumbnail of the album cover to which the music file belongs.
  def thumb
    data = @obj.thumb
    unless data.nil?
      return PhotoSize.new(data)
    end

    false
  end
end
