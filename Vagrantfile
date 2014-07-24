# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "hashicorp/precise32"
	config.vm.provision :shell, :path => "bootstrap.sh"
	config.vm.network "forwarded_port", guest: 3000, host: 3000
	config.vm.network "forwarded_port", guest: 80, host: 8000
end
