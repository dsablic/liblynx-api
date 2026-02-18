# LibLynx API &nbsp;[![CI](https://github.com/dsablic/liblynx-api/actions/workflows/ci.yml/badge.svg)](https://github.com/dsablic/liblynx-api/actions/workflows/ci.yml) [![Gem Version](https://badge.fury.io/rb/liblynx-api.svg)](https://badge.fury.io/rb/liblynx-api) [![Downloads](https://img.shields.io/gem/dt/liblynx-api.svg)](https://rubygems.org/gems/liblynx-api) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Ruby HTTP client for the LibLynx API.

## Installation

Add this line to your application's Gemfile:

```
gem 'liblynx-api'
```

And then execute:

```
bundle
```

Or install it yourself as:

```
gem install liblynx-api
```

## Usage example

```ruby
require 'liblynx-api'

client = LibLynxAPI.connect_oauth2(CLIENT_ID, CLIENT_SECRET)
# print account resources
pp client.account.list
```
