#!/bin/bash
curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644
sudo apt update -y && sudo apt install docker.io -y
sudo usermod -aG docker $USER
newgrp docker
kubectl cluster-info
docker --version
