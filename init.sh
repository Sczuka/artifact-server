#!/usr/bin/env bash

NEXUS_DATA=/srv/nexus3

sudo mkdir -p $NEXUS_DATA/data/etc/

if [ ! -f $NEXUS_DATA/data/etc/nexus.properties ]; then
   sudo cp nexus.properties $NEXUS_DATA/data/etc/nexus.properties
fi 

sudo chown -R 200:200 $NEXUS_DATA

if [ ! -f server.key ]; then
   echo "Generating private key"
   openssl genrsa -out server.key 2048
   echo "Generating Certificate Signing Reqeust"
   openssl req -new -key server.key -out server.csr
   echo "Creating certificate"
   openssl x509 -req -in server.csr -signkey server.key -out server.crt
fi
