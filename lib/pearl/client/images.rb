module Pearl
  class Client

    module Images
      # TODO: image filters
      def images(filter='')
        if /\A(my_images|global)\z/ === filter
          params = { filter: filter }
          response = request("images", params).body
        else
          response = request("images").body
        end

        pretty_table("Images", response)
      end

      def image(id)
        response = request("images/#{id}").body
        pretty_table("Image", response)
      end

      def destroy_image(id)
        response = request("images/#{id}/destroy").body
        pretty_event("Destroying image #{id}", response)
      end

      def transfer(id, region)
        params = { region_id: region }
        response = request("images/#{id}/transfer", params).body
        pretty_event("Transferring image '#{id}' to region #{region}", response)
      end
    end
  end
end