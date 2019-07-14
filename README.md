# update-docker-pihole

Tool for updating a pihole docker image to the latest version

## Usage: update-docker-pihole

### Options

| Arg                 | Description                                           |
| :------------------ | ----------------------------------------------------- |
| -e, --env           | Path to Docker container environmenment settings file |
| -r, --resolveconfig | Path to existing resolv.conf file                     |
| --hosts             | Path to existing hosts file                           |
| -c, --configpath    | Path to existing config folder                        |
| -l, --log           | Path to existing log folder                           |
| -h, --help          | Shows this help text                                  |

## Running pihole in docker container on a Synology NAS

See <https://github.com/jaspenlind/pihole-synology-docker-container> for more information
