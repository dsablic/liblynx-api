require 'heroics'
require_relative '../config/config'

require 'liblynx-api/client'
require 'liblynx-api/version'

module LibLynxAPI
  def self.fetch_oauth_token(id, secret)
    #client = connect(secret, user: id, url: 'https://connect.liblynx.com/oauth/v2/token')
    #client.post(body: 'grant_type=client_credentials')
  end
end
