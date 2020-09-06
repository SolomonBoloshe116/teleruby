#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'same/common_2'
require_relative 'photo_size'

# +Sunday+, +August+ +23+ +2020+

# ===This object represents a general file (as opposed to Photo, Voice messages and Audio files).
# Extend Common2 clas.
class Document < Common2
  def initialize(obj) # :nodoc:
    super(obj)
  end

  # +Optional+. Original filename as defined by sender.
  def file_name
    @obj.file_name
  end

  def thumb
    data = @obj.file_name
    unless data.nil?
      return PhotoSize.new(data)
    end

    false
  end
end
