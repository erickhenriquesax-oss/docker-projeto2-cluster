set -e
curl -fsSL https://get.docker.com | sh

systemctl enable docker
systemctl start docker
usermod -aG docker vagrant
