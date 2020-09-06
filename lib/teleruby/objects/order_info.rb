#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'shipping_address'

# This object represents information about an order.
class OrderInfo
  def initialize(info) # :nodoc:
    @info = info
  end

  # Optional. User name
  def name
    @info.name
  end

  # Optional. User's phone number.
  def phone_number
    @info.phone_number
  end

  # Optional. User email
  def email
    @info.email
  end

  # Optional. User shipping address
  def shipping_address
    address = @info.shipping_address
    unless address.nil?
      return ShippingAddress.new(address)
    end

    false
  end
end
