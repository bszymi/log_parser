# frozen_string_literal: true

module LogParser
  class PrintReport
    def print(header, data, postfix, no_data_message)
      p = "#{header}\n"
      if data.size.positive?
        data.each { |d| p = "#{p}#{d[0]} #{d[1]} #{postfix}\n" }
      else
        p = "#{p}#{no_data_message}\n"
      end
      p
    end
  end
end
