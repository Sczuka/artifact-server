#!/bin/bash
sudo cp server.crt /etc/pki/ca-trust/source/anchors/srv-de-thor-01.sma.de.crt
sudo update-ca-trust
sudo mkdir -p /etc/docker/certs.d/srv-de-thor-01.sma.de:9080/
sudo cp server.crt /etc/docker/certs.d/srv-de-thor-01.sma.de:9080/
sudo systemctl daemon-reload
sudo systemctl restart docker
