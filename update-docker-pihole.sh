#!/bash
if [[ $(id -u) -ne 0 ]]; then
  echo "usage: sudo sh update-docker-pihole.sh"
  exit 1
fi

echo -e "nameserver\t1.1.1.1" | sudo tee /etc/resolv.conf
docker pull pihole/pihole
docker rm -f pihole
docker network rm scripts_pihole_network
docker-compose up -d
cat .env | grep -Po '(?<=ServerIP\=).*(?=)' | awk '{ns="nameserver\t";print ns$1}' | sudo tee /etc/resolv.conf
