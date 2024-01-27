#!/bin/bash

echo "10.0.0.4 master
10.0.0.2 worker1
10.0.0.3 worker2" | sudo tee --append /etc/hosts