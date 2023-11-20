#!/bin/bash

curl -s https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash

sudo mv /bin/act /bin

rm -d /bin