require 'heroics'
require_relative '../config/config'

require 'liblynx-api/client'
require 'liblynx-api/version'

module LibLynxAPI
  # Get a Client configured to use OAuth2 client credentials authentication.
  #
  # @param id [String] The client id to use with the API.
  # @param secret [String] The client secret to use with the API.
  # @return [Client] A client configured to use the API with OAuth2
  #   authentication.
  def self.connect_oauth2(id, secret)
    client = connect(secret, user: id)
    token = client
      .token
      .create(grant_type: :client_credentials)
      .dig('access_token')
    connect_oauth(token)
  end
end
