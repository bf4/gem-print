# encoding: utf-8

require 'coderay'
module Gem
  module Print
    class Code

      def initialize(file_path)
        @file_path = file_path
        # import css classes from alpha style
        @css = CodeRay::Styles::Alpha::CSS_MAIN_STYLES << "\n" << CodeRay::Styles::Alpha::TOKEN_COLORS
      end

      def highlight
        "<!DOCTYPE html><html><head><style>#{@css}</style></head><body>" <<
        CodeRay.scan(code, :ruby).div(css: :class, style: :alpha,
          line_numbers: :table, line_number_start: 0) <<
        "</body></html>"
      end

      def code
        File.binread(@file_path)
      end

    end
  end
end
