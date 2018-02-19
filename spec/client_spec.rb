# frozen_string_literal: true

require 'securerandom'
require 'liblynx-api'

describe 'The generated liblynx api client' do
  before(:all) do
    @client = LibLynxAPI.connect_oauth2(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'])
    @test_domain = 'somedomain.com'
    @test_descriptor_url = 'http://bit.ly/2E5Srk5'
    @test_shib_entity = 'https://test-idp.ukfederation.org.uk/idp/shibboleth'
    @test_account_config = {
      'account_name' => SecureRandom.uuid,
      'publisher_reference' => SecureRandom.random_number(1_000_000).to_s,
      'email_domains' => "subdomain.#{@test_domain}\n#{@test_domain}"
    }
    @id_config = {
      user_agent: 'Some agent',
      ip: '127.0.0.1',
      url: "http://#{@test_domain}",
      email: "test@#{@test_domain}",
      force_sso_login: true
    }
  end

  it 'can get list the accounts' do
    expect(@client.account.list).to match(hash_including('accounts'))
  end

  context 'saml account' do
    before(:context) do
      @config = @test_account_config.merge('enable_saml' => true)
      @account = @client.account.create(@config)
    end

    it 'can create a new account' do
      expect(@account).to match(hash_including(@config))
    end

    it 'can update an account' do
      expect(@client.account.update(@account['id'], @config))
        .to match(hash_including(@config))
    end

    it 'can add saml idp descriptor url to an account' do
      expect { @client.samlidp.create(@account['id'], descriptor_url: @test_descriptor_url) }
        .not_to raise_error
    end

    it 'can list an account saml idps' do
      expect(@client.samlidp.list(@account['id']))
        .to match(hash_including('samlidps'))
    end

    context 'identification' do
      before(:context) do
        @identification = @client.identification.create(@id_config)
      end

      it 'can create new identification resource' do
        expect(@identification).to match(hash_including('target_account' =>
          hash_including(@config.slice('publisher_reference'))))
      end

      it 'can get identification resource info' do
        expect(@client.identification.info(@identification['id'])).to match(@identification)
      end

      it 'can delete an account' do
        expect { @client.account.delete(@account['id']) }.not_to raise_error
      end
    end
  end

  context 'shibboleth account' do
    before(:context) do
      @config = @test_account_config.merge(
        'enable_shibboleth' => true,
        'shibboleth_entity_id' => @test_shib_entity)
      @account = @client.account.create(@config)
    end

    it 'can create a new account' do
      expect(@account).to match(hash_including(@config))
    end

    it 'can update an account' do
      expect(@client.account.update(@account['id'], @config))
        .to match(hash_including(@config))
    end

    context 'identification' do
      before(:context) do
        @identification = @client.identification.create(@id_config)
      end

      it 'can create new identification resource' do
        expect(@identification).to match(hash_including('target_account' =>
          hash_including(@config.slice('publisher_reference'))))
      end

      it 'can get identification resource info' do
        expect(@client.identification.info(@identification['id'])).to match(@identification)
      end

      it 'can delete an account' do
        expect { @client.account.delete(@account['id']) }.not_to raise_error
      end
    end
  end
end
