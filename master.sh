
set -e
docker swarm init --advertise-addr=10.10.10.100
docker swarm join-token -q worker > /vagrant/worker-token

for i in {1..60}; do
    WORKERS=$(docker node ls --format '{{.Role}}' | grep -c worker || true)

    if [ "$WORKERS" -ge 3 ]; then
        break
    fi

    sleep 5
done

echo "Implantando aplicação..."

docker stack deploy -c /vagrant/docker-compose.yml laboratorio

echo "Serviços implantados!"

docker stack services laboratorio
