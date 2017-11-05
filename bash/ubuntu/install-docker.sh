#!/usr/bin/env bash

DOCKER="docker"

#Docker-ce
DOCKER_INSTALLED=$(dpkg-query -W --showformat='${Status}\n' $DOCKER | grep "install ok installed")
echo "Checking for $DOCKER: $DOCKER_INSTALLED"

if [ "" == "$DOCKER_INSTALLED" ]; then
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    apt-get update
    apt-cache policy docker-ce
    apt-get install -y docker-ce
fi