#!/usr/bin/env bash

# First install chefdk
# checkout ../bash/{your os}/install-chefdk.sh


# Configure chefdk
echo 'eval "$(chef shell-init bash)"' >> ~/.bash_profile
source ~/.bash_profile

# Install Docker
sudo yum install -y git yum-utils
sudo yum-config-manager --add-repo \
https://download.docker.com/linux/centos/docker-ce.repo
sudo yum makecache fast
sudo yum -y install docker-ce
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER
sudo systemctl stop getty@tty1.service
sudo systemctl mask getty@tty1.service
logout

#Log back in, the run:
docker network create --subnet=10.1.1.0/24 testnet
gem install kitchen-docker

#Configure Git
git config --global user.name "Name"
git config --global user.email "email@example.com"
git config --global core.editor vim
git config --global color.ui auto