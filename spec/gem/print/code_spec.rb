require 'spec_helper'
require 'gem/print/code'

module Gem::Print
  describe Code do

    it 'highlights code' do
      file_path = ::File.join('spec','fixtures', 'code.rb')
      gem_name = 'gem-love'
      highlighter  = Code.new(gem_name)

      spec = double('spec', ruby_files: [file_path])
      Gem::Print::Specification.should_receive(:new).with(gem_name).and_return(spec)

      highlighted_code = highlighter.highlight
      expect(highlighted_code).to include('<html')
      expect(highlighted_code).to include(%q{<span class="class">GemLove</span>})
    end

  end

end
