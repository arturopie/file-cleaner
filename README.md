# FileCleaner

This library filters lines or group of lines from a file by using regular expressions and ranges.

## Installation

Add this line to your application's Gemfile:

    gem 'file_cleaner'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install file_cleaner

## Usage

To remove all lines of file `/path/to/file` that match regular expression `/Remove me/`:

    require 'file_cleaner'
    FileCleaner.remove(pattern: /Remove me/,
                       file_path: /path/to/file)

To remove lines that match regular expression, a line above and a line bellow:

    FileCleaner.remove(pattern: /Remove me/,
                       file_path: /path/to/file,
                       range: -1..1)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
