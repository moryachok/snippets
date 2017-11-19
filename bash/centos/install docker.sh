#!/usr/bin/env bash

yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce

systemctl start docker # to start docker service
systemctl enable docker # to enable docker service on boot

sudo usermod -aG docker $USER # allow user to interruct with docker without sudo

### Optional
# "getty" service may conflict with docker
sudo systemctl stop getty@tty1.service
sudo systemctl mask getty@tty1.service
