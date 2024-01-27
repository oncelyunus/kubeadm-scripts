#!/bin/bash
#
# Common setup for crio

set -euxo pipefail

# Install CRI-O Runtime

OS="xUbuntu_22.04"

CRIO_VERSION="1.28"

echo "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/ /"|sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
echo "deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/$CRIO_VERSION/$OS/ /"|sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable:cri-o:$CRIO_VERSION.list

curl -L https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable:cri-o:$CRIO_VERSION/$OS/Release.key | sudo apt-key add -
curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/Release.key | sudo apt-key add -

sudo apt update

sudo apt info cri-o

sudo apt install -y cri-o cri-o-runc cri-tools

sudo systemctl daemon-reload
sudo systemctl start crio
sudo systemctl enable crio

sudo systemctl status crio


sudo crictl info