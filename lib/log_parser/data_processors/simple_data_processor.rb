# frozen_string_literal: true

module LogParser
  # simple data processor implementation
  class SimpleDataProcessor
    # @param [Hash] pages
    def initialize(pages)
      @pages = pages
    end

    def process(page, ip_address)
      @pages[page] = LogParser::PageViews.new unless @pages.key?(page)

      @pages[page].add_page_view(ip_address)
    end
  end
end
