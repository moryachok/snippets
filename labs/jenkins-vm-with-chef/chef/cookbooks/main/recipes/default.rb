#
# Cookbook:: main
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

log 'message' do
  message 'Hello Misha, the Creator of this amazing recipe!'
  level :info
end

execute "apt-get-update" do
  command "apt-get update"
  ignore_failure true
end

# helper packages for development purposes
# nmap - gives info about network on a system
['nmap','wget','git'].each do |p|
  package p do
    action :install
  end
end

execute 'set-JAVA_HOME' do
  command 'echo JAVA_HOME="`which java`" | tee -a /etc/environment'
  action :nothing
end

package 'default-jdk' do
  action :install
  notifies :run, 'execute[set-JAVA_HOME]'
end

execute 'wget-jenkins-keys' do
  command 'wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -'
  action :run
end

execute 'update-sources' do
  command "echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list"
  action :run
  notifies :run, 'execute[apt-get-update]'
end

package 'jenkins' do
  action :install
end

service 'jenkins' do
  supports status: true
  action [:enable, :start]
end

execute 'ufw-allow-8080' do
  command "ufw allow 8080"
  action :run
end

execute 'enable-firewall' do
  command "ufw allow OpenSSH && ufw enable"
  action :run
  notifies :run, 'execute[ufw-allow-8080]'
end
