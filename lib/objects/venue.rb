#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'location'

##
# +Monday+, +August+ +24+ +2020+ +EAT+
# ====This object represents a venue.
class Venue
  def initialize(vn) # :nodoc:
    @vn = vn
  end

  # Venue location. Returns Location Object.
  def location
    @vn.location
  end

  # Name of the venue.
  def title
    @vn.title
  end

  # Address of the venue.
  def address
    @vn.address
  end

  # +Optional+. Foursquare identifier of the venue
  def foursquare_id
    @vn.foursquare_id
  end

  # Optional. Foursquare type of the venue.
  # (For example, +“arts_entertainment/default”+,
  # +“arts_entertainment/aquarium”+ or +“food/icecream”.+)
  def foursquare_type
    @vn.foursquare_type
  end
end
