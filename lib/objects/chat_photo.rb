#!/usr/bin/ruby
# frozen_string_literal: true

##
# +Monday+, +August+ +24+ +2020+ +EAT+
# ===This object represents a chat photo.
class ChatPhoto
  def initialize(photo) # :nodoc:
    @photo = photo
  end

  # File identifier of small (160x160) chat photo. This file_id can be used
  # only for photo download and only for as long as the photo is not changed.
  def small_file_id
    @photo.small_file_id
  end

  # Unique file identifier of small (160x160) chat photo, which is supposed
  # to be the same over time and for different bots.
  # Can't be used to download or reuse the file.
  def small_file_unique_id
    @photo.small_file_unique_id
  end

  # File identifier of big (640x640) chat photo. This file_id can be used
  # only for photo download and only for as long as the photo is not changed.
  def big_file_id
    @photo.big_file_id
  end

  # Unique file identifier of big (640x640) chat photo, which is supposed
  # to be the same over time and for different bots.
  # Can't be used to download or reuse the file.
  def big_file_unique_id
    @photo.big_file_unique_id
  end
end
