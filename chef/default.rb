# installing apache on centos
package "apache2" do
    package_name 'httpd'
    action :install
end

# starting apache on centos
service "apache2" do
    service_name 'httpd'
    action [:start, :enable]
end

# Example of including other recipe
include_recipe 'apache::websites'


# installing postgres and then executing RUN on "postgresql-init" command
package 'postgresql-server' do
    action :install
    notifies :run, 'execute[postgresql-init]'
end

execute 'postgresql-init' do
    command 'postgresql-setup initdb'
    action :nothing
end

service 'postgresql' do
    action [:enable, :start]
end

