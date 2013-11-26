require 'spec_helper'
require 'shellwords'
require 'gem/print'

describe Gem::Print do

  specify 'prints a file' do
     run 'gem print gem-love'
     expect('gem_love.html').to eq(
       "<html>" <<
       "</html>"
     )

  end

  def run(shell_command)
    args = shell_command.sub(/^gem print /, '').shellsplit
    command = Gem::Commands::PrintCommand.new
    command.invoke(*args)
  end
end
