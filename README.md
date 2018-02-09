# LibLynx API &nbsp;[![Build Status](https://travis-ci.org/dsablic/liblynx-api.svg?branch=master)](https://travis-ci.org/dsablic/liblynx-api) [![Gem Version](https://badge.fury.io/rb/liblynx-api.svg)](https://badge.fury.io/rb/liblynx-api)

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
