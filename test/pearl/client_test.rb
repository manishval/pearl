require 'test_helper'

class ClientTest < Pearl::TestCase
  def test_initialization
    client = Pearl::Client.new(client_id: 'qwerty')
    assert_equal 'qwerty', client.client_id

    client = Pearl::Client.new(api_key: 'ytrewq')
    assert_equal 'ytrewq', client.api_key

    client = Pearl::Client.new(client_id: 'qwerty', api_key: 'ytrewq')
    assert_equal true, client.authenticated?

    # TODO
    # assert_raises(Pearl::Error) { Pearl::Client.new }
  end

  def test_base_url
    client = Pearl::Client.new
    assert_equal 'https://api.digitalocean.com/', client.base_url

    client = Pearl::Client.new(api_host: 'www.example.com')
    assert_equal 'https://www.example.com/', client.base_url
  end
end