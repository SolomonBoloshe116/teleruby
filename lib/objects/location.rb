#!/usr/bin/ruby
# frozen_string_literal: true

##
# +Monday+, +August+ +24+ +2020+ +EAT+
# ===This object represents a point on the map
class Location
  def initialize(location) # :nodoc:
    @loc = location
  end

  # Longitude as defined by sender.
  def longitude
    @loc.longitude
  end

  # Latitude as defined by sender.
  def latitude
    @loc.latitude
  end
end
