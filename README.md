# RpJson

Ruby Parse JSON

This Gem was created as a educational port of https://github.com/eatonphil/pj to get some basic experience with a 
lexer parser and keep my ruby fluency up.

Don't use this code for anything...  Use JSON


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rp_json'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rp_json

## Usage

Its implemented as a simple module function

```ruby
require 'rp_json'

json_string = '{"foo":"bar"}'
ruby_hash = RpJson.parse(json_string)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ajmaidak/rp_json. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/ajmaidak/rp_json/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RpJson project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ajmaidak/rp_json/blob/master/CODE_OF_CONDUCT.md).
