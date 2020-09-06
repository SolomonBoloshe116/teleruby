#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'user'
require_relative 'shipping_address'

# ===This object contains information about an incoming shipping query.
class ShippingQuery
  def initialize(query) # :nodoc:
    @query = query
  end

  # Unique query identifier.
  def id
    @query.id
  end

  # User who sent the query.
  def from
    User.new(@query.from)
  end

  # Bot specified invoice payload.
  def invoice_payload
    @query.invoice_payload
  end

  # User specified shipping address.
  def shipping_address
    ShippingAddress.new(@query.shipping_address)
  end
end
