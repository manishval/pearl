module Pearl
  class Client

    module Droplets
      def droplets
        response = request("droplets").body
        pretty_table("Droplets", response)
      end 

      def droplet(id)
        response = request("droplets/#{id}").body
        pretty_table('Droplet', response)
      end

      def create_droplet(options = {})
        params = { name: options[:name],
                   size_id: options[:size_id],
                   image_id: options[:image_id],
                   region_id: options[:region_id]
                 }
        response = request("droplets/new", params).body
        pretty_table("Droplet", response)
      end

      def reboot(id)
        response = request("droplets/#{id}/reboot").body
        pretty_event("Rebooting droplet #{id}", response)
      end

      def power_cycle(id)
        response = request("droplets/#{id}/power_cycle").body
        pretty_event("Power cycling droplet #{id}", response)
      end

      def shutdown(id)
        response = request("droplets/#{id}/shutdown").body
        pretty_event("Shuting down droplet #{id}", response)
      end

      def power_off(id)
        response = request("droplets/#{id}/power_off").body
        pretty_event("Powering off droplet #{id}", response)
      end

      def power_on(id)
        response = request("droplets/#{id}/power_on").body
        pretty_event("Powering on droplet #{id}", response)
      end

      def password_reset(id)
        response = request("droplets/#{id}/password_reset").body
        pretty_event("Resetting password for droplet #{id}", response)
      end

      def resize(id, size_id)
        params = { size_id: size_id }
        response = request("droplets/#{id}/resize", params).body
        pretty_event("Resizing droplet #{id}", response)
      end

      def snapshot(id, name)
        puts name
        params = { name: name }
        response = request("droplets/#{id}/snapshot", params).body
        pretty_event("Creating snapshot '#{name}' of droplet #{id}", response)
      end

      def restore(id, image_id)
        params = { image_id: image_id }
        response = request("droplets/#{id}/restore", params).body
        pretty_event("Restoring droplet #{id}", response)
      end

      def rebuild(id, image_id)
        params = { image_id: image_id }
        response = request("droplets/#{id}/rebuild", params).body
        pretty_event("Rebuilding droplet #{id}", response)
      end

      def enable_backups(id)
        response = request("droplets/#{id}/enable_backups").body
        pretty_event("Enabling auto backups for droplet #{id}", response)
      end

      def disable_backups(id)
        response = request("droplets/#{id}/disable_backups").body
        pretty_event("Disabling auto backups for droplet #{id}", response)
      end

      def destroy_droplet(id)
        response = request("droplets/#{id}/destroy").body
        pretty_event("Destroying droplet #{id}", response)
      end
    end
  end
end