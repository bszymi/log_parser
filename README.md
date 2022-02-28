# LogParser
Simple web server log parser

## Installation

TODO: this section need changes
Add this line to your application's Gemfile:

```ruby
gem 'log_parser'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install log_parser

## Usage

    Example:
    $ ./exe/parse_file --file=spec/fixtures/webserver_sample_1.log

## Future development
There are lots of  things that can be done better in future versions.
The most important:
 * when using Ruby 3, use interfaces for most classes
 * Output printer class could use view file, like in RoR
 * no unit tests for FileReader
 * validation could be rethink in SimpleLineParser, maybe its not the best place for this code
 * Extend documentation into most classes
