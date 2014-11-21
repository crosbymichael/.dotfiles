#!/bin/bash

apt-get update && apt-get upgrade -y && apt-get install -y \
    htop \
    git \
    make \
    curl \
    supervisor \
    cgroup-lite \
    aufs-tools

curl -o /usr/local/bin/docker http://crosbymichael.com.s3.amazonaws.com/docker
chmod +x /usr/local/bin/docker
curl -o /etc/supervisor/conf.d/docker.conf https://raw.githubusercontent.com/crosbymichael/.dotfiles/master/docker.conf

cd /root
git clone https://github.com/crosbymichael/.dotfiles
