module ClientMacros
  def local_client
    client = Pearl::Client.new(client_id: 'qwerty', 
                               api_key: 'qwerty12345')
  end
end