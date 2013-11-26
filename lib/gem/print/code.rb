# encoding: utf-8

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

      def higlight_file(file_path)
        code_for(file_path)
      end

      def highlight_files(file_paths)
        file_paths.map do |file_path|
          highlight_file(file_path)
        end
      end

      def paths_for(gem_name)
        cmd = Gem::Commands::ContentsCommand.new
        def cmd.say(*args)
          @file_paths ||= []
          @file_paths << args if args
          @file_paths
        end
        cmd.invoke(gem_name)
        file_paths = cmd.say
      end

      def code_for(file_path)
        File.binread(file_path)
      end

    end
  end
end
