require 'heroics'
require File.join(File.expand_path('../..', __FILE__), 'lib', 'liblynx-api', 'version.rb')

Heroics.default_configuration do |config|
  config.base_url = 'https://connect.liblynx.com'
  config.module_name = 'LibLynxAPI'
  config.schema_filepath = File.join(File.expand_path('../..', __FILE__), 'schema.json')
  config.headers = {
    'Accept'      => 'application/json',
    'User-Agent'  => "liblynx-api/#{LibLynxAPI::VERSION}"
  }
  config.cache_path = '#{Dir.home}/.heroics/liblynx-api'
end
