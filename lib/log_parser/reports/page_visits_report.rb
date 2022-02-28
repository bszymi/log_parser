# frozen_string_literal: true

module LogParser
  # Generates page visits report
  class PageVisitsReport
    def generate_report(pages)
      data = []
      pages.each { |key, value| data << [key, value.counter] }
      data.sort_by! { |e| -e[1] }
    end
  end
end
