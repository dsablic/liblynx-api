require 'heroics'
require_relative '../config/config'

require 'liblynx-api/client'
require 'liblynx-api/version'

module LibLynxAPI
  def self.connect_oauth2(id, secret)
    client = connect(secret, user: id)
    token = client
      .token
      .create(grant_type: :client_credentials)
      .dig('access_token')
    connect_oauth(token)
  end
end
