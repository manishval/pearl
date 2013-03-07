require 'multi_json'

require 'pearl/http'
require 'pearl/pretty_table'

module Pearl
  class Client
    Dir[File.expand_path('../client/*.rb', __FILE__)].each { |f| require f }

    include Droplets
    include Images
    include Regions
    include Sizes

    include PrettyTable

    attr_reader :client_id
    attr_reader :api_key
    attr_reader :api_host

    def initialize(options = {})
      @client_id = options[:client_id] || ENV['DIGITAL_OCEAN_CLIENT_ID']
      @api_key = options[:api_key]  || ENV['DIGITAL_OCEAN_API_KEY']
      @api_host = options[:api_host] || 'api.digitalocean.com'

      extend Pearl::HTTP

      raise 'Error: Invalid client id.' if @client_id.nil?
      raise 'Error: Invalid api key.' if @api_key.nil?
    end

    def base_url
      "https://#{@api_host}/"
    end

    def authenticated?
      @client_id != nil && @api_key != nil
    end
  end
end