#!/usr/bin/ruby
# frozen_string_literal: true

# ===This object represents a shipping address
class ShippingAddress
  def initialize(shipping) # :nodoc:
    @shipping = shipping
  end

  # ISO 3166-1 alpha-2 country code.
  def country_code
    @shipping.country_code
  end

  # State, if applicable.
  def state
    @shipping.state
  end

  # City
  def city
    @shipping.city
  end

  # First line for the address.
  def street_line1
    @shipping.street_lin2
  end

  # Second line for the address
  def street_line2
    @shipping.street_line2
  end

  # Address post code
  def post_code
    @shipping.post_code
  end
end
