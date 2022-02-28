# frozen_string_literal: true

require 'spec_helper'

describe 'ParseFileWithData' do

  context 'parse webserver_sample_1.log ' do
    it 'should return reports' do
      expect { system %(./exe/parse_file --file=spec/fixtures/webserver_sample_1.log ) }
        .to output(fixture('sample_1_output.txt').read)
              .to_stdout_from_any_process
    end
  end
end
