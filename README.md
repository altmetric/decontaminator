# Decontaminator

Ruby HTML sanitizer based on a lightweight Oga parser.

**Current version:** 1.0.2

**Supported Ruby versions:** >= 2.7

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

Copyright © 2015-2024 Altmetric LLP

Distributed under the [MIT license](https://github.com/altmetric/decontaminator/blob/master/LICENSE.txt).
