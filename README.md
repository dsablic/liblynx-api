# LibLynx API &nbsp;[![Build Status](https://secure.travis-ci.org/mkdynamic/liblynx-api.svg?branch=master)](https://travis-ci.org/mkdynamic/liblynx-api)

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
