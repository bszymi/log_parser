# frozen_string_literal: true
require 'set'

module LogParser
  class PageViews
    attr_reader :counter, :unique_ip_addresses

    def initialize
      @counter = 0
      @unique_ip_addresses = Set[]
    end

    def add_page_view(ip_address)
      @counter += 1
      @unique_ip_addresses << ip_address
      self
    end
  end
end
