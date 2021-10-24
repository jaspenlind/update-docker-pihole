# update-docker-pihole

Tool for updating a pihole docker image to the latest version

## docker-compose

Edit the docker-compose.yml file to reflect your setup

## Environment

* Create an .env-file and configure your environment settings

```bash
ServerIP=<<YOUR_PIHOLE_SERVER_IP>>
WEBPASSWORD=<<YOUR_PIHOLE_PASSWORD>>
```

## Usage

```bash
sudo docker-compose up
```

## Running pihole in docker container on a Synology NAS

See <https://github.com/jaspenlind/pihole-synology-docker-container> for more information
