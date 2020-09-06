#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'photo_size'

##
# +Monday+, +August+ +24+ +2020+
# ==This object represent a user's profile pictures.
class UserProfilePhotos
  def initialize(photo) # :nodoc:
    @photo = photo
  end

  #
  # Total number of profile pictures the target user has.
  def total_count
    @photo.total_count
  end

  ##
  # Requested profile pictures (in up to 4 sizes each).
  # Returns array of array of PhotoSize.
  def photos
    data = @photo.photos
    photo_size = []
    data.each do |e|
      ary = []
      e.each do |e_d|
        ary << PhotoSize.new(e_d)
      end
      photo_size << ary
    end

    photo_size
  end
end
