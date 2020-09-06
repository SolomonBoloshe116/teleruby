#!/usr/bin/ruby
# frozen_string_literal: true

# This object describes the position on faces where a mask should be
# placed by default.
class MaskPosition
  def initialize(pos) # :nodoc:
    @pos = pos
  end

  # The part of the face relative to which the mask should be placed.
  # One of “forehead”, “eyes”, “mouth”, or “chin”.
  def point
    @pos.point
  end

  # Shift by X-axis measured in widths of the mask scaled to the face size,
  # from left to right. For example, choosing -1.0 will place mask just to
  # the left of the default mask position.
  def x_shift
    @pos.x_shift
  end

  # Shift by Y-axis measured in heights of the mask scaled to the face size,
  # from top to bottom. For example, 1.0 will place the mask just below the
  # default mask position.
  def y_shift
    @pos.y_shift
  end

  # Mask scaling coefficient. For example, 2.0 means double size.
  def scale
    @pos.scale
  end
end
