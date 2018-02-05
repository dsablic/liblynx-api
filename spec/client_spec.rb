require 'securerandom'
require 'liblynx-api'

describe 'The generated liblynx api client' do
  before(:all) {
    @client = LibLynxAPI.connect_oauth2(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'])
  }

  it 'can get list the accounts' do
    expect(@client.account.list).to match(hash_including('accounts'))
  end

  context 'account' do
    before(:context) do
      @test_account_config = {
        'account_name' => SecureRandom.uuid,
        'publisher_reference' => SecureRandom.random_number(1_000_000).to_s,
        'email_domains' => '*.somedomain.com'
      }
      @account = @client.account.create(@test_account_config)
    end

    it 'can create a new account' do
      expect(@account).to match(hash_including(@test_account_config))
    end

    it 'can delete an account' do
      expect { @client.account.delete(@account['id']) }.not_to raise_error
    end
  end

  context 'identification' do
    before(:context) do
      @identification = @client.identification.create(
        user_agent: 'Some agent',
        ip: '127.0.0.1',
        url: 'http://somedomain.com',
        email: 'test@example.org')
    end

    it 'can create new identification resource' do
      expect(@identification).to match(hash_including('target_account' =>
        hash_including('publisher_reference')))
    end

    it 'can get identification resource info' do
      expect(@client.identification.info(@identification['id'])).to match(@identification)
    end
  end
end
