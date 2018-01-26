require 'liblynx-api'

describe 'The generated liblynx api client' do
  it 'can obtain the oauth token' do
    expect(token).not_to be_empty
  end

  def token
    @token ||= LibLynxAPI.fetch_oauth_token(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'])
  end

  def client
    @client ||= LibLynxAPI.connect_oauth(token)
  end
end
