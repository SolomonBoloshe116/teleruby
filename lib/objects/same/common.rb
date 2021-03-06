#!/usr/bin/ruby
# frozen_string_literal: true

##
# +Monday+, +August+ +24+ +2020+ +EAT+
# ===Common class
class Hash
  def method_missing(method_name)
    self[method_name.to_s]
  end
end

class Common
  def initialize(obj) # :nodoc:
    @obj = obj
  end

  def file_id
    @obj.file_id
  end

  def file_unique_id
    @obj.file_unique_id
  end

  def width
    @ob.width
  end

  def heigth
    @obj.heigth
  end

  def file_size
    @obj.file_size
  end
end
