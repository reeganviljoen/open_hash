# OpenHash
An openHash is a data structure, similar to a Hash, that allows you to use dot notation to access and assign key value pairs similar to an `open_struct`, this is an experimental library at the moment to test if their is a performance improvement when using a different approach to get similar results to `open_struct`

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add open_hash

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install open_hash

## Usage

  ### Initialization

  You can use the constructor:
    `test_open_hash = OpenHash.new(test_key_1: 'test', 'test_key_2' => 5)`

  **OR**

  You can convert a `hash` to on `open_hash`
  `test_open_hash = { test_key_1: 'test', 'test_key_2' => 5 }.to_open_hash`

  ### Methods

  - You can access any key as a method:
    ```
    test_open_hash = { test_key_1: 'test', 'test_key_2' => 5 }.to_open_hash
    test_open_hash.test_key_1 # "test"
    ```
  - You can assign any new key with a method
    ```
    test_open_hash = { test_key_1: 'test', 'test_key_2' => 5 }.to_open_hash
    test_open_hash.test_key_3 = 'test_3'
    test_open_hash # {:test_key_1=>"test", "test_key_2"=>5, :test_key_3=>"test_3"}
    ```
  - You assign an existing key with a method
    ```
    test_open_hash = { test_key_1: 'test', 'test_key_2' => 5 }.to_open_hash
    test_open_hash.test_key_2 = 'test_2'
    test_open_hash # {:test_key_1=>"test", "test_key_2"=>"test_2"}
    ```
  - You can test whether a key exists with a predicate method
    ```
    test_open_hash = { test_key: 'test'}.to_open_hash
    # if a Key exists
    test_open_hash.test_key? # true

    # if a key does not exist
    test_open_hash.test_key_2? # false
    ```




## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/open_hash. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/open_hash/blob/master/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the OpenHash project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/open_hash/blob/master/CODE_OF_CONDUCT.md).
