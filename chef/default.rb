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
