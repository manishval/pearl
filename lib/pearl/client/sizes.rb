module Pearl
  class Client

    module Sizes
      def sizes
        response = request("sizes").body
        pretty_table("Sizes", response)
      end
    end
  end
end