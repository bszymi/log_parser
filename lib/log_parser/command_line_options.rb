# frozen_string_literal: true

require 'optparse'

module LogParser
  # Produce command line options
  # --file option is required and cannot be empty
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
