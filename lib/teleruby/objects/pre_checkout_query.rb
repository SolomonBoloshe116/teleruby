#!/usr/bin/ruby
# frozen_string_literal: true

require_relative 'user'
require_relative 'order_info'

# This object contains information about an incoming pre-checkout query.
class PreCheckoutQuery
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

  # Three-letter ISO 4217 currency code
  def currency
    @query.currency
  end

  # Total price in the smallest units of the currency 
  # (integer, not float/double). For example, for a price of US$ 1.45
  #  pass amount = 145 . See the exp parameter in currencies.json,
  # it shows the number of digits past the decimal point for each 
  # currency (2 for the majority of currencies).
  def total_count
    @query.total_count
  end

  # Bot specified invoice payload.
  def invoice_option_id
    @query.invoice_option_id
  end

  def order_info
    info = @query.order_info
    unless info.nil?
      return OrderInfo.new(info)
    end

    false
  end
end
