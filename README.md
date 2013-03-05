# Pearl

Pearl is the command line interface to DigitlOcean's API.

## Setup

Run the following command to install

    $ gem install pearl

## Usage

### Droplets

To see all your droplets

    $ pearl droplets

To view a droplet

    $ pearl droplet -d 1

To create a droplet

    $ pearl droplet add 'name' --size 1 --image 1 --region 1

    or

    $ pearl droplet add 'name' -s 1 -i 1 -r 1

Reboot a droplet

    $ pearl droplet reboot -d 1

Power cycle droplet

    $ pearl droplet power cycle -d 1

Shutdown droplet

    $ pearl droplet shutdown -d 1

Power Off droplet

    $ pearl droplet power off -d 1

Power On droplet

    $ pearl droplet power_on -d 1

Reset root password

    $ pearl droplet password_reset -d 1

Resize droplet

    $ pearl droplet resize -d 1 --size 2

Take a snapshot

    $ pearl droplet snapshot 'snapshot_name' -d 1

Restore droplet

    $ pearl droplet restore -d 1 --image 2

Rebuild droplet

    $ pearl droplet rebuild -d 1 --image 2

Enable automatic backups

    $ pearl droplet enable backups -d 1

Disable automatic backups

    $ pearl droplet disable backups -d 1

Destroy droplet

    $ pearl droplet destroy -d 1

### Regions

Display regions

    $ pearl regions

### Sizes

Display regions

      $ pearl sizes

### Images

Display images

    $ pearl images

To display your images

    $ pearl images --filter my

To display global images (default)

    $ pearl images --filter global

View a single image

    $ pearl image -i 1

To destroy an image

    $ pearl image destroy -i 1

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
