#!/bin/bash

sudo apt update 

sudo apt-get install -y \
    openjdk-17-jre \
    openjdk-17-jdk \
    openjdk-17-demo \
    openjdk-17-doc \
    openjdk-17-jre-headless \
    openjdk-17-source

# allows setting default java with 
# sudo update-alternatives --config java
sudo apt install update-alternatives 


# https://www.digitalocean.com/community/tutorials/install-maven-linux-ubuntu
# https://maven.apache.org/download.cgi
wget https://dlcdn.apache.org/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.tar.gz
tar -xvf apache-maven-3.9.5-bin.tar.gz
sudo mv apache-maven-3.9.5 /opt/