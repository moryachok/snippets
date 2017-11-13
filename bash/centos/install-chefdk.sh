#!/usr/bin/env bash

yum install -y wget

wget https://packages.chef.io/files/stable/chefdk/2.3.4/el/7/chefdk-2.3.4-1.el7.x86_64.rpm

rpm -ivh chefdk-*.rpm

#configuring ruby binary for chef
echo 'eval "$(chef shell-init bash)"' >> ~/.bash_profile
source ~/.bash_profile
which chef  #/opt/chefdk/bin/chef
which ruby #/opt/chefdk/embedded/bin/ruby