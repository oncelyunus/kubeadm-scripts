#!/bin/bash

echo "10.0.0.4 master
10.0.0.4 vmi1619987
10.0.0.2 worker1
10.0.0.2 vmi1509347
10.0.0.3 vmi1509345
10.0.0.3 worker2" | sudo tee --append /etc/hosts