ROOT_PATH=/volume1/docker/pihole
CONFIG_PATH=$ROOT_PATH//etc/pihole
RESOLV_CONFIG=$ROOT_PATH/etc/resolv.conf
HOSTS=$ROOT_PATH/etc/hosts
LOG_PATH=$ROOT_PATH/var/log
ENV_PATH=$ROOT_PATH/pihole.env
HELP=false
ARGS=""

# Credits: https://stackoverflow.com/a/14203146
for i in "$@"
do
case $i in
    -e|--env=*)
    ENV_PATH="${i#*=}"
    shift # past argument=value
    ;;
    -r=*|--resolveconfig=*)
    RESOLV_CONFIG="${i#*=}"
    shift # past argument=value
    ;;
    --hosts=*)
    HOSTS="${i#*=}"
    shift # past argument=value
    ;;
    -c=*|--configpath=*)
    CONFIG_PATH="${i#*=}"
    shift # past argument=value
    ;;
    -l=*|--log=*)
    LOG_PATH="${i#*=}"
    shift # past argument=value
    ;;
    -h|--help)
    HELP=true
    shift # past argument=value
    ;;
    --default)
    DEFAULT=YES
    shift # past argument with no value
    ;;
    *)
          # unknown option
    ;;
esac
done

if [ "$HELP" = true ]; then
    echo 'Usage: update-docker-pihole

A script for updating pihole docker images to the latest version

Options:
    -e, --env   Path to Docker container environmenment settings file
    -r, --resolveconfig Path to existing resolv.conf file
    --hosts Path to existing hosts file
    -c, --configpath    Path to existing config folder
    -l, --log   Path to existing log folder'
    exit 0
fi

if [ -n "$RESOLV_CONFIG" ] ; then
 ARGS=" -v $RESOLV_CONFIG:/etc/resolv.conf"
fi

if [ -n "$HOSTS" ] ; then
 ARGS="$ARGS -v $HOSTS:/etc/hosts"
fi

if [ -n "$CONFIG_PATH" ] ; then
 ARGS="$ARGS -v $CONFIG_PATH:/etc/pihole"
fi

if [ -n "$LOG_PATH" ] ; then
 ARGS="$ARGS -v $LOG_PATH:/var/log"
fi

if [ -n "$ENV_PATH" ] ; then
 ARGS="$ARGS --env-file $ENV_PATH"
fi

echo Fetching latest pihole Docker image
docker pull pihole/pihole
echo Removing current pihole container
docker rm -f pihole
echo Creating and starting the new pihole container
docker run --name pihole --privileged --network host --restart always$ARGS pihole/pihole