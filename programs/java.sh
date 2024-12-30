#!/bin/bash

sudo apt update

sudo apt-get install -y \
    openjdk-17-jre \
    openjdk-17-jdk \
    openjdk-17-doc \
    openjdk-17-source

sudo apt-get install -y \
    openjdk-21-jre \
    openjdk-21-jdk \
    openjdk-21-doc \
    openjdk-21-source

# allows setting default java with
# sudo update-alternatives --config java
sudo apt install update-alternatives


# https://www.digitalocean.com/community/tutorials/install-maven-linux-ubuntu
# https://maven.apache.org/download.cgi
wget https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz
tar -xvf apache-maven-3.9.9-bin.tar.gz
sudo mv apache-maven-3.9.9 /opt/
