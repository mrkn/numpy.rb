# Numpy wrapper for Ruby

This library enables to directry call [numpy](http://pandas.pydata.org/) from Ruby language.
This uses [pycall](https://github.com/mrkn/pycall.rb).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'numpy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install numpy

## Usage

Example usage:

```ruby
require 'numpy'

x = Numpy.asarray([[1, 2, 3], [4, 5, 6]])
puts x
# [[1 2 3]
#  [4 5 6]]

puts x[1, 1..2]
# [5 6]

puts x.T
# [[1 4]
#  [2 5]
#  [3 6]]

puts x.dot x.T
# [[14 32]
#  [32 77]]

puts x.reshape([3, 2])
# [[1 2]
#  [3 4]
#  [5 6]]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mrkn/numpy.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
