#!/usr/bin/ruby
# frozen_string_literal: true

##
# +Monday+, +August+ +24+ +2020+
# ===This object represents a file ready to be downloaded.
class TFile
  def initialize(file) # :nodoc:
    @file = file
  end

  # Identifier for this file, which can be used to download or reuse the file.
  def file_id
    @file.file_id
  end

  # Unique identifier for this file, which is supposed to be the same over
  # time and for different bots. Can't be used to download or reuse the file.
  def file_unique_id
    @file.file_unique_id
  end

  # +Optional+. File size, if known.
  def file_size
    @file.file_size
  end

  # +Optional+. File path.
  def file_path
    @file.file_path
  end
end
