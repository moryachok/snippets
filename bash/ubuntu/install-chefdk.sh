#!/usr/bin/env bash

# getting the chef-dk client
wget https://packages.chef.io/files/stable/chefdk/2.3.4/ubuntu/14.04/chefdk_2.3.4-1_amd64.deb

# unpack % install the downloaded file
dpkg -i chefdk_*.deb && rm chefdk_*.deb

chef -v


#configuring ruby binary for chef
echo 'eval "$(chef shell-init bash)"' >> ~/.bash_profile
source ~/.bash_profile
which chef  #/opt/chefdk/bin/chef
which ruby #/opt/chefdk/embedded/bin/ruby

