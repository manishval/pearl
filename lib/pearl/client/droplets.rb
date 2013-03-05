module Pearl
  class Client

    module Droplets
      def droplets
        puts request("droplets").body
      end 

      def droplet(id)
        puts request("droplets/#{id}").body
      end

      def create_droplet(options = {})
        params = { name: options[:name],
                   size_id: options[:size_id],
                   image_id: options[:image_id],
                   region_id: options[:region_id]
                 }
        puts request("droplets/new", params).body
      end

      def reboot(id)
        puts request("droplets/#{id}/reboot").body
      end

      def power_cycle(id)
        puts request("droplets/#{id}/power_cycle").body
      end

      def shutdown(id)
        puts request("droplets/#{id}/shutdown").body
      end

      def power_off(id)
        puts request("droplets/#{id}/power_off").body
      end

      def power_on(id)
        puts request("droplets/#{id}/power_on").body
      end

      def password_reset(id)
        puts request("droplets/#{id}/password_reset").body
      end

      def resize(id, size_id)
        params = { size_id: size_id }
        puts request("droplets/#{id}/resize", params).body
      end

      def snapshot(id, name)
        params = { name: name }
        puts request("droplets/#{id}/snapshot", params).body
      end

      def restore(id, image_id)
        params = { image_id: image_id }
        puts request("droplets/#{id}/restore", params).body
      end

      def rebuild(id, image_id)
        params = { image_id: image_id }
        puts request("droplets/#{id}/rebuild", params).body
      end

      def enable_backups(id)
        puts request("droplets/#{id}/enable_backups").body
      end

      def disable_backups(id)
        puts request("droplets/#{id}/disable_backups").body
      end

      def destroy_droplet(id)
        puts request("droplets/#{id}/destroy").body
      end
    end
  end
end