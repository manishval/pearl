# Pearl

Pearl is a command line interface to DigitlOcean's API.

## Setup

Run the following command to install

    $ gem install pearl

Add your client id and api key as enviroment variables

    ENV['DIGITAL_OCEAN_CLIENT_ID']
    ENV['DIGITAL_OCEAN_API_KEY']

## Usage

### Droplets

To see all your droplets

    $ pearl droplets

To view a droplet

    $ pearl droplet -d <droplet id>

To create a droplet

    $ pearl droplet add 'name' --size <size id> --image <image id> --region <region id>

    or

    $ pearl droplet add 'name' -s <size id> -i <image id> -r <region id>

Reboot a droplet

    $ pearl droplet reboot -d <droplet id>

Power cycle droplet

    $ pearl droplet power cycle -d <droplet id>

Shutdown droplet

    $ pearl droplet shutdown -d <droplet id>

Power Off droplet

    $ pearl droplet power off -d <droplet id>

Power On droplet

    $ pearl droplet power_on -d <droplet id>

Reset root password

    $ pearl droplet password_reset -d <droplet id>

Resize droplet

    $ pearl droplet resize -d <droplet id> -s <size id>

Take a snapshot

    $ pearl droplet snapshot 'snapshot_name' -d <droplet id>

Restore droplet

    $ pearl droplet restore -d <droplet id> -i <image id>

Rebuild droplet

    $ pearl droplet rebuild -d <droplet id> -i <image id>

Enable automatic backups

    $ pearl droplet enable backups -d <droplet id>

Disable automatic backups

    $ pearl droplet disable backups -d <droplet id>

Destroy droplet

    $ pearl droplet destroy -d <droplet id>

### Regions

Display regions

    $ pearl regions

### Sizes

Display regions

      $ pearl sizes

### Images

Display all images

    $ pearl images

To display your images

    $ pearl images --filter my

To display global images (default)

    $ pearl images --filter global

View a single image

    $ pearl image -i <image id>

To destroy an image

    $ pearl image destroy -i <image id>

## TODO

* Format output instead of just printing the json response.
* Add SSH resource.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
