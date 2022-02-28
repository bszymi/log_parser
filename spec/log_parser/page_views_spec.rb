require 'spec_helper'

describe 'PageViews' do

  context 'initialise' do
    it 'initial' do
      page_view = LogParser::PageViews.new
      expect(page_view.counter).to eq 0
      expect(page_view.unique_ip_addresses).to eq Set[]
    end
  end

  context 'page has views' do
    let(:page_view)  {LogParser::PageViews.new}

    it 'add first page view' do
      page_view.add_page_view('1.1.1.1')
      expect(page_view.counter).to eq 1
      expect(page_view.unique_ip_addresses).to eq Set['1.1.1.1']
    end
  end

  context 'page has 1 view' do
    let(:page_view) do
      page_view = LogParser::PageViews.new
      page_view.add_page_view('1.1.1.1')
      page_view
    end

    it 'add page view with the existing IP' do
      page_view.add_page_view('1.1.1.1')
      expect(page_view.counter).to eq 2
      expect(page_view.unique_ip_addresses).to eq Set['1.1.1.1']
    end

  end

  context 'page has 2 views' do
    let(:page_view) do
      page_view = LogParser::PageViews.new
      page_view.add_page_view('1.1.1.1')
      page_view.add_page_view('1.1.1.1')
      page_view
    end

    it 'add page view with the new IP' do
      page_view.add_page_view('1.1.1.2')
      expect(page_view.counter).to eq 3
      expect(page_view.unique_ip_addresses).to eq Set['1.1.1.1', '1.1.1.2']
    end
  end

end
