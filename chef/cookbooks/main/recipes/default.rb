#
# Cookbook:: main
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
package 'apache' do
  package_name "apache2"
  action :install
end


service 'apache' do
  service_name "apache2"
  action [:enable, :start]
end
