require 'spec_helper'
require 'shellwords'
require 'gem/print'

describe Gem::Print do

  specify 'prints a file' do
    printer = double('printer', :highlight => '')
    Gem::Print::Code.should_receive(:new).with('gem-love').and_return(printer)

    run 'gem print gem-love'
  end

  def run(shell_command)
    args = shell_command.sub(/^gem print /, '').shellsplit
    command = Gem::Commands::PrintCommand.new
    command.invoke(*args)
  end

end
