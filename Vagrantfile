# we configuring 2 different virtual machines in order to get both ubuntu and centos OS(s)
#

Vagrant.configure(2) do |config|
  config.vm.define "ubuntu" do |ubuntu|
      ubuntu.vm.box = "ubuntu/trusty64"
      ubuntu.vm.hostname = "ubuntu"
      ubuntu.vm.network "private_network", ip: "192.168.33.15"
      # config.vm.provision "shell", path: "{somepath.sh}"
  end

# centos based box has problem with syncing files in a real time
  config.vm.define "centos" do |centos|
      centos.vm.box = "centos/7"
      centos.vm.hostname = "centos"
      centos.vm.network "private_network", ip: "192.168.33.25"
  end
end
