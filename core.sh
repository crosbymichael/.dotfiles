#!/bin/bash

set -e

# install system dependencies 
apt-get install -y \
    htop \
    git \
    make \
    curl \
    supervisor \
    cgroup-lite \
    aufs-tools

# install docker from master
curl -SsL -o /usr/local/bin/docker https://master.dockerproject.com/linux/amd64/docker
chmod +x /usr/local/bin/docker
curl -o /etc/supervisor/conf.d/docker.conf https://raw.githubusercontent.com/crosbymichael/.dotfiles/master/docker.conf

# install docker-compose
curl -L https://github.com/docker/fig/releases/download/1.1.0-rc2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose; chmod +x /usr/local/bin/docker-compose

