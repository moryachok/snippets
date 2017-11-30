#
# Cookbook:: main
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

log 'message' do
  message 'Hello Misha, the Creator of this amazing recipe!'
  level :info
end


package 'java8-runtime-headless' do
  action :install
end
