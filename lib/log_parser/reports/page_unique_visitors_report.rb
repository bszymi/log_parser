# frozen_string_literal: true

module LogParser
  # Generates unique visitors report
  class PageUniqueVisitorsReport
    def generate_report(pages)
      data = []
      pages.each { |key, value| data << [key, value.unique_ip_addresses.size] }
      data.sort_by! { |e| -e[1] }
    end
  end
end
