#!/usr/bin/env bash

yum install -y wget

wget https://packages.chef.io/files/stable/chefdk/2.3.4/el/7/chefdk-2.3.4-1.el7.x86_64.rpm

rpm -ivh chefdk-*.rpm

