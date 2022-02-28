# frozen_string_literal: true

require 'rspec'

describe 'PrintReport' do
  context 'print' do
    let(:print_report) { LogParser::PrintReport.new }
    let(:data) { [['p1', 7], ['p2', 3], ['p3', 1]] }

    it 'should return string' do
      expect(print_report.print('Visits per page', data, 'visits',
                                'No data')).to eq "Visits per page\np1 7 visits\np2 3 visits\np3 1 visits\n"
    end
  end

  context 'print when no data' do
    let(:print_report) { LogParser::PrintReport.new }
    let(:data) { {} }

    it 'should return string' do
      expect(print_report.print('Visits per page', data, 'visits', 'No data')).to eq "Visits per page\nNo data\n"
    end
  end
end
