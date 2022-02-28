# frozen_string_literal: true

require 'optparse'

module LogParser
  class CommandLineOptions

    attr_reader :command

    def initialize(command)
      @command = command
    end

    def parse_command_line(args)
      options = {}
      parser = OptionParser.new do |opts|
        opts.banner = "Usage: #{@command} [options]"

        opts.on('--file=FILE', String, 'Filename') do |f|
          options[:filename] = f
        end
      end

      parser.parse!(args)

      raise OptionParser::MissingArgument, '--file' if options[:filename].nil?

      options
    end
  end
end
