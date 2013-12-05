require 'spec_helper'
require 'shellwords'
require 'gem/print'


# general idea
# 1. gem print gem-love
# 2. rubygem print command
#   gem_name = 'gem-love'
#   Print::Code.new(gem_name).highlight
# 3. code highlighter
#   spec from name
#   files from spec
#   concat files
#   highlight files
#   output html
# 4. profit
describe Gem::Print do

  specify 'instantiates Code with gem name argument and runs highlight' do
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
