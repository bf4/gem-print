require 'rubygems/command'
class Gem::Commands::PrintCommand < Gem::Command
  def initialize
    super 'print', 'concats and highlights the specified gem files'
  end

  def arguments
    "GEM_NAME           the name of the gem you wish to print"
  end

  def usage
    "#{program_name} GEM_NAME"
  end

  def description
    "concats and highlights the specified gem files"
  end

  def execute
    gem_name = get_one_gem_name
    Gem::Print::Code.new(gem_name).highlight
  end

end
