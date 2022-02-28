# frozen_string_literal: true

require_relative 'log_parser/version'

module LogParser
  autoload :CommandLineOptions, 'log_parser/command_line_options'
  autoload :PageViews, 'log_parser/page_views'

  # data readers
  autoload :FileReader, 'log_parser/data_readers/file_reader'

  # data processors
  autoload :SimpleDataProcessor, 'log_parser/data_processors/simple_data_processor'

  # line parsers
  autoload :SimpleLineParser, 'log_parser/line_parsers/simple_line_parser'

  # log processors
  autoload :LogProcessor, 'log_parser/log_processors/log_processor'

  # output
  autoload :PrintReport, 'log_parser/output/print_report'

  # reports
  autoload :PageVisitsReport, 'log_parser/reports/page_visits_report'
  autoload :PageUniqueVisitorsReport, 'log_parser/reports/page_unique_visitors_report'
end
