module Pearl
  class Client

    module Images
      # TODO: image filters
      def images(filter)
        if filter === /\A(my|global)\z/
          params = { filter: name }
          puts request("images", params).body
        else
          puts request("images").body
        end
      end

      def image(id)
        puts request("images/#{id}").body
      end

      def destroy_image(id)
        puts request("images/#{id}").body
      end
    end
  end
end