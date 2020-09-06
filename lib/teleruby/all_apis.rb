#!/usr/bin/ruby
# frozen_string_literal: false

# APIs
require_relative 'api/send_apis'
require_relative 'api/set_apis'
require_relative 'api/delete_apis'
require_relative 'api/other_apis'
require_relative 'api/get_apis'
require_relative 'api/nstandard'

module Telegram
  module AllApis
    # directory => api
    include SendApis     # send_apis.rb
    include SetApis      # set_apis.rb
    include DeleteApis   # delete_apis.rb
    include OtherApis    # other_apis.rb
    include GetApis      # get_apis.rb
    include NonStandard  # nstandard.rb
  end
end
