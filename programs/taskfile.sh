#!/usr/bin/env bash

curl -1sLf 'https://dl.cloudsmith.io/public/task/task/setup.deb.sh' | sudo -E bash

sudo apt install task -y