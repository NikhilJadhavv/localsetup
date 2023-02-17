#!/bin/bash

sudo apt-get update
echo "....................Docker installation"

sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) 

	signed-by=/etc/apt/keyrings/docker.gpg] 

	https://download.docker.com/linux/ubuntu $(lsb_release 

	-cs) stable" | sudo tee 

	/etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo apt remove containerd

sudo apt-get update

apt install containerd.io

rm /etc/containerd/config.toml

systemctl restart containerd


echo "...................kubernetes installation"

sudo apt-get update

sudo apt-get install -y apt-transport-https ca-certificates curl

sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sour

sudo apt-get update

sudo apt-get install -y kubelet kubeadm kubectl

sudo apt-mark hold kubelet kubeadm kubectl

echo "..................calico installation"

sudo swapoff -a

sudo sed -i '/ swap / s/^/#/' /etc/fstab

sudo kubeadm init --pod-network-cidr=10.244.0.0/16

sudo curl https://docs.projectcalico.org/manifests/calico-typha.yaml -o calico.yaml

kubectl apply -f calico.yaml

kubectl taint nodes --all node-role.kubernetes.io/control-plane-

kubectl taint nodes --all node.kubernetes.io/not-ready:NoSchedule-

kubectl get nodes

kubectl get pods


echo "......................complete"

