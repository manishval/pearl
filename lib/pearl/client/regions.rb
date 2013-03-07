module Pearl
  class Client

    module Regions
      def regions
        response = request("regions").body
        pretty_table("Regions", response)
      end
    end
  end
end