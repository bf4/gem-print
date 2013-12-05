# encoding: utf-8
require 'gem/print/file'

require 'coderay'
module Gem
  module Print
    class Code

      def initialize(gem_name)
        @gem_name = gem_name
        # import css classes from alpha style
        @css = CodeRay::Styles::Alpha::CSS_MAIN_STYLES << "\n" << CodeRay::Styles::Alpha::TOKEN_COLORS
      end

      def highlight
        "<!DOCTYPE html><html><head><style>#{@css}</style></head><body>" <<
        CodeRay.scan(code, :ruby).div(css: :class, style: :alpha,
          line_numbers: :table, line_number_start: 0) <<
        "</body></html>"
      end

      private

      # get files from spec, read in, and concat with line break
      # @todo include path info in file contents
      def code
        Gem::Print::File.from_spec(@gem_name).map(&:contents).join("\n")
      end

    end
  end
end
