# frozen_string_literal: true

module LogParser
  # Implements Data Reader for files
  class FileReader
    def initialize(line_parsers)
      @line_parsers = line_parsers
    end

    def process(source)
      File.foreach(source) { |line| @line_parsers.parse(line) }
    end
  end
end
