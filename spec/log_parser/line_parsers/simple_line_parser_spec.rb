# frozen_string_literal: true

require 'rspec'

describe 'SimpleLineParser' do
  context 'parse' do
    let(:data_processor) { double }
    let(:line_parser) { LogParser::SimpleLineParser.new(data_processor) }

    it 'should return false if line not match' do
      expect(line_parser.parse('abc')).to eq false
    end

    it 'should return false if ip not match' do
      expect(line_parser.parse('abc 300.0.0.1')).to eq false
    end

    it 'should process if line matches' do
      expect(data_processor).to receive(:process).with('abc', '1.1.1.1')
      line_parser.parse('abc 1.1.1.1')
    end
  end
end
