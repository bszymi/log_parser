# frozen_string_literal: true

require 'resolv'

module LogParser
  class SimpleLineParser

    # @param [Object] data_processor
    def initialize(data_processor)
      @data_processor = data_processor
    end

    def parse(line)
      matches = %r{^([/\w_\.]+)\s([\d\.]+)$}.match(line)
      return false if matches.nil? #  not a log file line
      return false if (matches[2] =~ Resolv::IPv4::Regex).nil?

      @data_processor.process(matches[1], matches[2])
    end

  end
end
