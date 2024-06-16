#!/bin/bash
export TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
echo $TOKEN

PUBLIC_IP=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/public-ipv4)
echo $PUBLIC_IP

curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644 server --tls-san $PUBLIC_IP
sudo apt update -y && sudo apt install docker.io -y
sudo usermod -aG docker $USER
newgrp docker
kubectl cluster-info
docker --version
