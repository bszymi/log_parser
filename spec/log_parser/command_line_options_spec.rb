# frozen_string_literal: true

require 'spec_helper'

describe 'CommandLineOptions' do
  let(:command_line) { LogParser::CommandLineOptions.new('test') }

  context 'file option set' do
    let(:args) { ['--file=x'] }

    it 'should return option hash' do
      expect(command_line.parse_command_line(args)).to eq filename: 'x'
    end
  end

  context 'invalid option' do
    let(:args) { ['--abc=x'] }

    it 'should rise OptionParser::InvalidOption' do
      expect { command_line.parse_command_line(args) }.to raise_error(OptionParser::InvalidOption)
    end
  end

  context 'missing option' do
    let(:args) { [] }

    it 'should rise OptionParser::MissingArgument' do
      expect { command_line.parse_command_line(args) }.to raise_error(OptionParser::MissingArgument)
    end
  end

  context 'file argument empty' do
    let(:args) { ['--file='] }

    it 'should rise OptionParser::MissingArgument' do
      expect { command_line.parse_command_line(args) }.to raise_error(OptionParser::InvalidArgument)
    end
  end

end
