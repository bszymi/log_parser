# frozen_string_literal: true

module LogParser
  # General log processor
  # Require passing concrete implementations of data_processor, line_parser and data_reader classes
  class LogProcessor
    attr_reader :pages

    def initialize(data_processor_class:, line_parser_class:, data_reader_class:)
      @pages = {}

      data_processor = data_processor_class.new(@pages)
      line_parser = line_parser_class.new(data_processor)
      @data_reader = data_reader_class.new(line_parser)
    end

    def process(source)
      @data_reader.process(source)
    end
  end
end
