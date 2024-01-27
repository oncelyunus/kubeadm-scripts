#!/bin/bash
#
# Setup for Control Plane (Master) servers

set -euxo pipefail

POD_CIDR="192.168.0.0/16"

IP="84.247.189.236"

CRI_SOCKET="unix:///var/run/crio/crio.sock"

sudo kubeadm config images pull

sudo kubeadm init --pod-network-cidr=192.168.0.0/16 --apiserver-advertise-address="$IP" --control-plane-endpoint="$IP" --cri-socket="$CRI_SOCKET"

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
