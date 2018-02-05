require 'securerandom'
require 'liblynx-api'

describe 'The generated liblynx api client' do
  subject(:client) {
    LibLynxAPI.connect_oauth2(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'])
  }

  it 'can connect' do
    expect { client }.not_to raise_error
  end

  it 'can get list the accounts' do
    expect(client.account.list).to match(hash_including('accounts'))
  end

  let(:test_account_config) {
    {
      account_name: SecureRandom.uuid,
      publisher_reference: SecureRandom.random_number(1_000_000),
      email_domains: ['*.somedomain.com']
    }
  }

  let(:account) {
    client.account.create(test_account_config)
  }

  it 'can create and delete a new account' do
    expect(account).to match(hash_including('account_name' =>
      test_account_config[:account_name]))
    expect { client.account.delete(account['id']) }.not_to raise_error
  end

  let(:id_resource) {
    client.identification.create(
      user_agent: 'Some agent',
      ip: '127.0.0.1',
      url: 'http://somedomain.com',
      email: 'test@example.org')
  }

  it 'can create new identification resource' do
    expect(id_resource).to match(hash_including('target_account' =>
      hash_including('publisher_reference')))
    expect(client.identification.info(id_resource['id'])).to match(id_resource)
  end
end
