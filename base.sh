#!/bin/bash

apt-get update && apt-get upgrade -y && apt-get install -y \
    htop \
    mosh \
    git \
    make \
    curl \
    supervisor \
    cgroup-lite \
    aufs-tools

curl -SsL -o /usr/local/bin/docker https://master.dockerproject.com/linux/amd64/docker
chmod +x /usr/local/bin/docker
curl -o /etc/supervisor/conf.d/docker.conf https://raw.githubusercontent.com/crosbymichael/.dotfiles/master/docker.conf

cd $HOME
git clone https://github.com/crosbymichael/.dotfiles
