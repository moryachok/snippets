#
# Cookbook:: generic
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

template '/var/www/html/index.html' do
  source '/var/www/html/index.html'
  owner 'apache'
  group 'apache'
  mode '0644'
end
