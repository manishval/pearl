require "pearl/version"
require "pearl/error"
require "pearl/client"

module Pearl
  class << self

    # Alias for Pearl::Client.new
    #
    # @return [Peal::Client]
    def new(options = {})
      Client.new(options)
    end

    # Delegate to Pearl::Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    # Forward respond_to? to Pearl::Client
    def respond_to?(method, include_private = false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end
