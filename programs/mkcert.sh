#!/bin/bash

# for reference: https://hollo.me/devops/routing-to-multiple-docker-compose-development-setups-with-traefik.html

# mkcert 
curl -JLO "https://dl.filippo.io/mkcert/latest?for=linux/amd64"
chmod +x mkcert-v*-linux-amd64
sudo mv mkcert-v*-linux-amd64 /usr/local/bin/mkcert