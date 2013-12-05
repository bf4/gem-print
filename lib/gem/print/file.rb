# encoding: utf-8
require 'gem/print/specification'

module Gem
  module Print
    class File

      def initialize(file_name)
        @file_name = file_name
      end

      def contents
        ::File.binread(@file_name)
      end

      def self.from_spec(gem_name)
        Specification.new(gem_name).ruby_files.map do |file_name|
          new(file_name)
        end
      end

    end
  end
end
