require 'liblynx-api'

describe 'The generated liblynx api client' do
  it 'can connect' do
    expect { client }.not_to raise_error
  end

  it 'can create new identification resource' do
    expect(id_resource).to match(hash_including('target_account' => hash_including('publisher_reference')))
  end

  it 'can get the identification resource info' do
    expect(client.identification.info(id_resource['id'])).to match(id_resource)
  end

  it 'can get list the accounts' do
    expect(client.account.list).to match(hash_including('accounts'))
  end

  def id_resource
    @id_resource ||= client.identification.create(
      user_agent: 'Some agent',
      ip: '127.0.0.1',
      url: 'http://somedomain.com',
      email: 'test@example.org')
  end

  def client
    @client ||= LibLynxAPI.connect_oauth2(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'])
  end
end
