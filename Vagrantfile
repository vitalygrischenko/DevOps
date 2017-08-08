Vagrant.configure("2") do |config|
config.vm.box = "bertvv/centos72"
  config.vm.provider "virtualbox" do |vb|
  vb.gui = true
  end
  
  # Config Server1
	config.vm.define "server1" do |server1|
	config.vm.hostname = "server1"
	config.vm.network "private_network", ip: "172.16.0.1"
	# config.vm.synced_folder "/vagrant", "E:\\DevOps\\"

	server1.vm.provision "shell", path: "config_vm.sh"
	server1.vm.provision "shell",
		inline: "sudo echo '172.16.0.2 server2 server2' >> /etc/hosts"

	end
  
  # Config Server2
	config.vm.define "server2" do |server2|
	config.vm.hostname = "server2"
	config.vm.network "private_network", ip: "172.16.0.2"
    
	server2.vm.provision "shell",
		inline: "sudo echo '172.16.0.1 server1 server1' >> /etc/hosts"
	
	end
end
