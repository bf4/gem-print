# encoding: utf-8

module Gem
  module Print
    class Specification
      NoSuchSpecError = Class.new(StandardError)

      attr_reader :spec

      # @param gem_name [String]
      # Finds the Gem::Specication for the given gem_name or
      #  raise a NoSuchSpecError
      def initialize(gem_name, lib_only = false)
        @lib_only = lib_only
        @spec = Gem::Specification.find_all_by_name(gem_name).last or
          fail NoSuchSpecError.new("No spec found for #{gem_name}")
      end

      def ruby_files
        gem_path  = spec.full_gem_path
        extra     = "/{#{spec.require_paths.join ','}}"  if @lib_only
        glob      = "#{gem_path}#{extra}/**/*"
        prefix_re = /#{Regexp.escape(gem_path)}\//

        Dir[glob].map do |file|
          [gem_path, file.sub(prefix_re, "")]
        end
      end

    end
  end
end
