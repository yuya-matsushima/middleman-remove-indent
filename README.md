# Middleman::RemoveIndention

`middleman-remove-indention' remove indention from build files (ex: .html, .css).

## Installation

Add this line to your application's Gemfile:

    gem 'middleman-remove-indention'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install middleman-remove-indention

## Usage

In `config.rb`:

    configure :build do
      activate :remove_indention
    end

Then `middleman-remove-indention` remove indention from `build/\*.html`, `build/\*.css`.

if you want to remove indention only `.html`, you could do with `:exts` option:

    configure :build do
      activate :remove_indention, :exts => %(.html) #  default is %(.html .css)
    end

if you want to remove BLANK LINE too, you could do with `:remove_blank_line' option:

    configure :build do
      activate :remove_indention, :remove_blank_line => true # default is false
    end

## Contributing

1. Fork it ( http://github.com/yterajima/middleman-remove-indention/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
