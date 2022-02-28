# frozen_string_literal: true

require 'spec_helper'

describe 'ParseFileNoData' do

  context 'parse webserver_wrong_data.log ' do
    it 'should return empty reports' do
      expect { system %(./exe/parse_file --file=spec/fixtures/webserver_wrong_data.log ) }
        .to output(fixture('no_data_output.txt').read)
              .to_stdout_from_any_process
    end
  end
end
