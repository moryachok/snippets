#!/usr/bin/env bash

#This script will install NodeJS

#Packages
NODE="nodejs"
BUILD_ESSENTIAL="build-essential"
GIT="git"

#Prerequisites: git
GIT_INSTALLED=$(dpkg-query -W --showformat='${Status}\n' $GIT | grep "install ok installed")
echo "Checking for $GIT: $GIT_INSTALLED"

if [ "" == "$GIT_INSTALLED" ]; then
    apt-get update
    apt-get install -y $GIT && nano && tree
fi


#Node.js
NODE_INSTALLED=$(dpkg-query -W --showformat='${Status}\n' $NODE | grep "install ok installed")
echo "Checking for $NODE: $NODE_INSTALLED"

if [ "" == "$NODE_INSTALLED" ]; then
    apt-get install -y python-software-properties
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
    apt-get install -y build-essential nodejs
fi
