# Decontaminator [![Build Status](https://travis-ci.org/altmetric/decontaminator.svg?branch=master)](https://travis-ci.org/altmetric/decontaminator)

Ruby HTML sanitizer based on a lightweight Oga parser.

**Current version:** 0.0.0
**Supported Ruby versions:** 1.9.3, 2.0, 2.1, 2.2, JRuby 1.7, and Rubinius 2.5

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'decontaminator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install decontaminator

## Usage

```ruby
require 'decontaminator'

input = '<h1>Heading</h1><p>Lorem ipsum...</p><script>alert(1)</script>'
fragment = Decontaminator::Fragment.new(input)
puts fragment.decontaminate.inspect
" Heading  Lorem ipsum... "
```

## Contributing

1. Fork it ( https://github.com/altmetric/decontaminator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

Copyright © 2015 Altmetric LLP

Distributed under the [MIT license](https://github.com/altmetric/decontaminator/blob/master/LICENSE.txt).
