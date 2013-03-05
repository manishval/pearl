require "optparse"

require 'pearl'

module Pearl
  module CLI
    # Parse command line arguments
    def self.execute(*args)
      droplet = nil
      image = nil
      region = nil
      size = nil

      images_filter = nil

      opts = OptionParser.new do |opts|
        opts.banner = "Usage: pearl [resource] [options]"

        opts.on('-d', '--droplet [DROPLET ID]', 'Select the droplet with this id') do |d|
          droplet = d
        end

        opts.on('-f', '--filter', 'Display either your images or global images') do |filter|
          images_filter = filter
        end

        opts.on('-h', '--help', 'Display this message') do
          puts opts
          exit
        end

        opts.on('-i', '--image [IMAGE ID]', 'Set the image for the droplet') do |i|
          image = i
        end

        opts.on('-r', '--region [REGION ID]', 'Set the region for the droplet') do |r|
          region = r
        end

        opts.on('-s', '--size [SIZE ID]', 'Set the size forthe droplet') do |s|
          size = s
        end

        opts.on('-v', '--version', 'Display version') do
          puts Pearl::VERSION
          exit
        end

        begin
          opts.parse!(args)

          if $stdin.tty? && args[0] != '-'

            # Print help when args is empty
            if args.empty?
              puts opts
              exit
            end

            # Join command(s) to make it easier to catch using regex
            command = args.join(' ')

            case command.to_s
            when /\Adroplets\z/i
              Pearl.droplets
              exit
            when /\Adroplet\z/i
              droplet_id = droplet.to_i
              raise 'Error: Invalid droplet id.' if droplet_id == 0 || !droplet_id.is_a?(Fixnum)

              Pearl.droplet(droplet_id)
              exit
            when /\Adroplet add \w{3,}\z/i
              image_id = image.to_i
              raise 'Error: Invalid image id.' if image_id == 0 || !image_id.is_a?(Fixnum)

              region_id = region.to_i
              raise 'Error: Invalid region id.' if region_id == 0 || !region_id.is_a?(Fixnum)

              size_id = size.to_i
              raise 'Error: Invalid size id.' if size_id == 0 || !size_id.is_a?(Fixnum)

              name = command.split(' ', 3)[2]
              raise 'Error: Invalid droplet name.' if name.nil? || name.length <= 0

              options = { name: name,  image_id: image_id, region_id: region_id, size_id: size_id }

              Pearl.create_droplet(options)
              exit
            when /\Adroplet reboot\z/i
              droplet_id = droplet.to_i
              raise 'Error: Invalid droplet id.' if droplet_id == 0 || !droplet_id.is_a?(Fixnum)

              Pearl.reboot(droplet_id)
              exit
            when /\Adroplet power cycle\z/i
              droplet_id = droplet.to_i
              raise 'Error: Invalid droplet id.' if droplet_id == 0 || !droplet_id.is_a?(Fixnum)

              Pearl.power_cycle(droplet_id)
              exit
            when /\Adroplet shutdown\z/i
              droplet_id = droplet.to_i
              raise 'Error: Invalid droplet id.' if droplet_id == 0 || !droplet_id.is_a?(Fixnum)

              Pearl.shutdown(droplet_id)
              exit
            when /\Adroplet power off\z/i
              droplet_id = droplet.to_i
              raise 'Error: Invalid droplet id.' if droplet_id == 0 || !droplet_id.is_a?(Fixnum)

              Pearl.power_off(droplet_id)
              exit
            when /\Adroplet power on\z/i
              droplet_id = droplet.to_i
              raise 'Error: Invalid droplet id.' if droplet_id == 0 || !droplet_id.is_a?(Fixnum)

              Pearl.power_on(droplet_id)
              exit
            when /\Adroplet password reset\z/i
              droplet_id = droplet.to_i
              raise 'Error: Invalid droplet id.' if droplet_id == 0 || !droplet_id.is_a?(Fixnum)

              Pearl.password_reset(droplet_id)
              exit
            when /\Adroplet resize\z/i
              droplet_id = droplet.to_i
              raise 'Error: Invalid droplet id.' if droplet_id == 0 || !droplet_id.is_a?(Fixnum)

              size_id = size.to_i
              raise 'Error: Invalid size id.' if size_id == 0 || !size_id.is_a?(Fixnum)

              Pearl.resize(droplet_id, size_id)
              exit
            when /\Adroplet snapshot \w{3,}\z/i
              droplet_id = droplet.to_i
              raise 'Error: Invalid droplet id.' if droplet_id == 0 || !droplet_id.is_a?(Fixnum)

              name = command.split(' ', 2)
              raise 'Error: Invalid snapshot name.' if name.nil? || name.length <= 0

              Pearl.snapshot(droplet_id, name)
              exit
            when /\Adroplet restore\z/i
              droplet_id = droplet.to_i
              raise 'Error: Invalid droplet id.' if droplet_id == 0 || !droplet_id.is_a?(Fixnum)

              image_id = image.to_i
              raise 'Error: Invalid size id.' if image_id == 0 || !image_id.is_a?(Fixnum)

              Pearl.restore(droplet_id, image_id)
              exit
            when /\Adroplet rebuild\z/i
              droplet_id = droplet.to_i
              raise 'Error: Invalid droplet id.' if droplet_id == 0 || !droplet_id.is_a?(Fixnum)

              image_id = image.to_i
              raise 'Error: Invalid size id.' if image_id == 0 || !image_id.is_a?(Fixnum)

              Pearl.rebuild(droplet_id, image_id)
              exit
            when /\Adroplet enable backups\z/i
              droplet_id = droplet.to_i
              raise 'Error: Invalid droplet id.' if droplet_id == 0 || !droplet_id.is_a?(Fixnum)

              Pearl.enable_backups(droplet_id)
              exit
            when /\Adroplet disable backups\z/i
              droplet_id = droplet.to_i
              raise 'Error: Invalid droplet id.' if droplet_id == 0 || !droplet_id.is_a?(Fixnum)

              Pearl.disable_backups(droplet_id)
              exit
            when /\Adroplet (destroy|delete)\z/i
              droplet_id = droplet.to_i
              raise 'Error: Invalid droplet id.' if droplet_id == 0 || !droplet_id.is_a?(Fixnum)

              Pearl.destroy_droplet(droplet_id)
              exit
            when /\Aimages\z/i
              Pearl.images(images_filter)
              exit
            when /\Aimage\z/i
              image_id = image.to_i
              raise 'Error: Invalid image id.' if image_id == 0 || !image_id.is_a?(Fixnum)

              Pearl.image(image_id) 
              exit
            when /\Aimage (destroy|delete)\z/i
              image_id = image.to_i
              raise 'Error: Invalid image id.' if image_id == 0 || !image_id.is_a?(Fixnum)

              Pearl.destroy_image(image_id)
              exit
            when /\Aregions\z/i
              Pearl.regions
              exit
            when /\Asizes\z/i
              Pearl.sizes
              exit
            else
              puts "Error: '#{command}' is an invalid command."
            end
          end
        rescue Interrupt
          error("Command cancelled.")
        rescue => error
          warn error
          puts opts
        end
      end
    end
  end
end