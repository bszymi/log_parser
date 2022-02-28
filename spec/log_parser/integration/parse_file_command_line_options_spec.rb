# frozen_string_literal: true

require 'spec_helper'

describe 'ParseFileCommandLineOptions' do

  it 'missing file option' do
    expect { system %(./exe/parse_file) }
      .to output(a_string_including('missing argument: --file'))
      .to_stdout_from_any_process
  end

  it 'file option empty' do
    expect { system %(./exe/parse_file --file=) }
      .to output(a_string_including('invalid argument: --file'))
      .to_stdout_from_any_process
  end

  it 'file option not set ' do
    expect { system %(./exe/parse_file --file) }
      .to output(a_string_including('missing argument: --file'))
      .to_stdout_from_any_process
  end


end
