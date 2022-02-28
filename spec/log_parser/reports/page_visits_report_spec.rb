require 'rspec'

describe 'PageVisitsReport' do
  let(:report) { LogParser::PageVisitsReport.new }

  context 'generate_report when pages empty' do
    let(:pages) { {} }

    it 'should return empty array' do
      expect(report.generate_report(pages)).to eq []
    end
  end

  context 'generate_report when no duplicate pages' do
    let(:page_1_views) { double(counter: 1, unique_ip_addresses: [1]) }
    let(:page_2_views) { double(counter: 2, unique_ip_addresses: [1,2]) }
    let(:pages) do
      {
        'page_1' => page_1_views,
        'page_2' => page_2_views,
      }
    end

    it 'should return sorted array' do
      expect(report.generate_report(pages)).to eq [['page_2', 2], ['page_1', 1]]
    end
  end

  context 'generate_report when duplicate visitors' do
    let(:page_1_views) { double(counter: 6, unique_ip_addresses: [1]) }
    let(:page_2_views) { double(counter: 3, unique_ip_addresses: [1,2]) }
    let(:pages) do
      {
        'page_1' => page_1_views,
        'page_2' => page_2_views,
      }
    end

    it 'should return sorted array' do
      expect(report.generate_report(pages)).to eq [['page_1', 6], ['page_2', 3]]
    end
  end

end
