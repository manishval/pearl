module Pearl
  class Client

    module Regions
      def regions
        puts request("regions").body
      end
    end
  end
end