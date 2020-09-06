#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'file'
require_relative 'photo_size'
require_relative 'mask_position'

##
# This object represents a sticker.
# Extends from TFile
class Sticker < TFile
  def initialize(sticker) # :nodoc:
    super(sticker)
  end

  # Sticker width
  def width
    @file.width
  end

  # Sticker height
  def height
    @sticker.height
  end

  # True, if the sticker is animated
  def animated?
    @sticker.is_animated
  end

  # Optional. Sticker thumbnail in the .WEBP or .JPG format
  def thumb
    tmb = @sticker.thumb
    if tmb
      return PhotoSize.new(tmb)
    end

    false
  end

  # Optional. Emoji associated with the sticker
  def emoji
    @sticker.emoji
  end

  # Optional. Name of the sticker set to which the sticker belongs.
  def set_name
    @sticker.set_name
  end

  def mask_position
    msk_pos = @sticker.mask_position
    if msk_pos
      return MaskPosition.new(msk_pos)
    end

    false
  end
end
