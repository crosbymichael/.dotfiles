# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"

    # Docker port
    config.vm.forward_port 4243, 4243
   
    bootstrap = "apt-get update; apt-get upgrade -y; apt-get install -y puppet;"
    bootstrap << "apt-get install -y git-core;"
    bootstrap << "git clone https://github.com/crosbymichael/.dotfiles;"
    bootstrap << "cd .dotfiles/ && ./bootstrap.sh"

    config.vm.provision :shell, :inline => bootstrap
end
