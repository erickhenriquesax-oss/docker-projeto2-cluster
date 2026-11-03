
set -e

echo "Aguardando token do master..."

until [ -s /vagrant/worker-token ]; do
    sleep 5
done

TOKEN=$(cat /vagrant/worker-token)

echo "Conectando ao Docker Swarm..."

docker swarm join \
    --token "$TOKEN" \
    10.10.10.100:2377

echo "Worker conectado!"
