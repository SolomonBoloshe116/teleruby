#!/usr/bin/ruby
# frozen_string_literal: true

# just to requeire all files
filer = File.new('all.rb', 'a+')

Dir.entries('.').each do |file|
    filer.puts "require_relative \"#{file[0..-4]}\""
end
