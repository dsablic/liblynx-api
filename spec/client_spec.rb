require 'liblynx-api'

describe 'The generated liblynx api client' do
  it 'can connect' do
    expect { client }.not_to raise_error
  end

  def client
    @client ||= LibLynxAPI.connect_oauth2(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'])
  end
end
