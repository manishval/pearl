module Pearl
  class Client

    module Sizes
      def sizes
        puts request("sizes").body
      end
    end
  end
end