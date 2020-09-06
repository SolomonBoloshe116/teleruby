#!/usr/bin/ruby
# frozen_string_literal: true

##
# +Monday+, +August+ +24+ +2020+ +EAT+
# ===This object represents a phone contact.
class Contact
  def initialize(conta) # :nodoc:
    @conta = conta
    freeze
  end

  # Contact's phone number.
  def phone_number
    @conta.phone_number
  end

  # Contact's first name
  def first_name
    @conta.first_name
  end

  # +Optional+. Contact's last name
  def last_name
    @conta.last_name
  end

  # +Optional+. Contact's user identifier in Telegram
  def user_id
    @conta.user_id
  end

  # +Optional.+ Additional data about the contact in the form of a vCard
  def vcard
    @conta.vcard
  end
end
