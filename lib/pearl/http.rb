module Pearl
  module HTTP
    require 'net/https'
    require 'uri'

    private
    def http
      return @http if @http

      uri = URI.parse(self.base_url)
      @http = Net::HTTP.new(uri.host, uri.port)

      @http.use_ssl = true
      @http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      @http
    end

    def request(path, params = nil)
      uri = URI.parse("#{self.base_url}#{path}")

      auth_params = { client_id: self.client_id, api_key: self.api_key }

      if params.nil?
        params = auth_params
      else
        params.merge(auth_params)
      end  

      uri.query = URI.encode_www_form(params)

      request = Net::HTTP::Get.new(uri.request_uri)

      request['Content-Type'] = 'application/json'

      response = http.request(request)
      
      Response.new(response)
    end

    class Response
      attr_accessor :code
      attr_accessor :body

      def initialize(response)
        @code = response.code
        @body = response.body
      end
    end
  end
end