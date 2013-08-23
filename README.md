# Filmtipset

API client for the Filmtipset API (requires access key)

## Installation

Add this line to your application's Gemfile:

    gem 'filmtipset'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install filmtipset

## Setup

```ruby
Filmtipset.access_key = 'your_access_key'
```

## Usage

```ruby
# Get 'The Matrix' by id
Filmtipset.movie id: 143

# Get 'Brad Pitt' by id
Filmtipset.person id: 123

# Get 'Pulp Fiction' by IMDB id
Filmtipset.imdb id: '0110912'

# Get a list the movies you’ve seen
Filmtipset.list userkey: <YOUR_USER_KEY>, id: 'seen'

# Get recommendations for 'Kortfilm'
Filmtipset.recommendations userkey: <YOUR_USER_KEY>, id: 2
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
