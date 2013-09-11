# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"

    #config.vm.network :public_network
    config.vm.network :forwarded_port, guest: 8888, host: 8888
    config.vm.network :forwarded_port, guest: 4243, host: 4243
    config.vm.network "private_network", ip: "192.168.56.100"

    config.vm.synced_folder ".", "/home/vagrant/.dotfiles"
    config.vm.synced_folder "~/development/gocode/src", "/home/vagrant/development/gocode/src"
    config.vm.synced_folder "~/development/projects", "/home/vagrant/development/projects"
    config.vm.synced_folder "~/development/playground", "/home/vagrant/development/playground"

    bootstrap = "cd /home/vagrant/.dotfiles; ./bootstrap.sh"
    config.vm.provision :shell, :inline => bootstrap

    config.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--memory", 1536, "--cpus", 2]
    end
end
