#!/bin/bash

# Remove old docker version
sudo apt-get remove docker docker-engine docker.io

# If ubuntu 14.04 add extra kernel

if [ lsb_release -cs  == "trusty" ]; then
    sudo apt-get update
    sudo apt-get install \
        linux-image-extra-$(uname -r) \
        linux-image-extra-virtual
fi

# Update repo

sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common -y

# Add The docker official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -


# Add the repo to the source list
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update repo list
sudo apt-get update
sudo apt-get install docker-ce -y

echo "Test the installation with sudo docker run hello-world"
