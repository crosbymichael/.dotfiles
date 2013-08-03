# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    config.vm.customize ["modifyvm", :id, "--memory", 2048, "--cpus", 2]

    # Docker port
    config.vm.forward_port 4243, 4243

    config.vm.share_folder "dotfiles", "/home/vagrant/.dotfiles", "."
   
    bootstrap = "apt-get update;"
    bootstrap << "cd /home/vagrant/.dotfiles; ./bootstrap.sh"

    config.vm.provision :shell, :inline => bootstrap
end
