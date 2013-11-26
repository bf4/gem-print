require 'spec_helper'
require 'gem/print/code'

module Gem::Print
  describe Code do

    it 'highlights code' do
      file_path = File.join('spec','fixtures', 'code.rb')
      highlighted_code = Code.new(file_path).highlight
      expect(highlighted_code).to include('<html')
      expect(highlighted_code).to include(%q{<span class="class">GemLove</span>})
    end

  end
end
