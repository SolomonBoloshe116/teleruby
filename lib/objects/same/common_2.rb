#!/usr/bin/ruby
# frozen_string_literal: true

##
# +Monday,+ +August+ +24+ +2020+
class Hash
  def method_missing(method_name)
    self[method_name.to_s]
  end
end

# ===common class for Audio, Video, and Document and Voice
class Common2
  def initialize(obj) # :nodoc:
    @obj = obj
    freeze
  end

  # File id for the object
  def file_id
    @obj.file_id
  end

  # File unique id for the object.
  def file_unique_id
    @obj.file_unique_id
  end

  # +Optional+. MIME type of the file as defined by sender.
  def mime_type
    @obj.mime_type
  end

  # +Optional.+ File size
  def file_size
    @obj.file_size
  end
end
