# frozen_string_literal: true

require 'rspec'

describe 'SimpleDataProcessor' do

  context 'process empty pages' do
    let(:pages) { {} }
    let(:data_processor) { LogParser::SimpleDataProcessor.new(pages) }

    it 'add page_1 view' do
      data_processor.process('page_1', '1.1.1.1')
      expect(pages.key?('page_1')).to eq true
      expect(pages.size).to eq 1
      expect(pages['page_1'].counter).to eq 1
    end

  end

  context 'process when page exist' do
    before do
      @pages = {}
      @data_processor = LogParser::SimpleDataProcessor.new(@pages)
      @data_processor.process('page_1', '1.1.1.1')
    end

    it 'add next page_1 view' do
      @data_processor.process('page_1', '1.1.1.1')
      expect(@pages.key?('page_1')).to eq true
      expect(@pages.size).to eq 1
      expect(@pages['page_1'].counter).to eq 2
    end

  end

  context 'process new page when pages not empty' do
    before do
      @pages = {}
      @data_processor = LogParser::SimpleDataProcessor.new(@pages)
      @data_processor.process('page_1', '1.1.1.1')
    end

    it 'add page_2 view' do
      @data_processor.process('page_2', '1.1.1.1')
      expect(@pages.key?('page_2')).to eq true
      expect(@pages.size).to eq 2
      expect(@pages['page_1'].counter).to eq 1
      expect(@pages['page_2'].counter).to eq 1
    end

  end
end
