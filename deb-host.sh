#!/bin/sh

# base install script for debian based systems
# this can be installed on both dev boxes and servers
set -e

apt-get update && apt-get upgrade -y

apt-get install -y \
    htop \
    curl \
    supervisor \
    cgroup-lite \
    aufs-tools

curl -o /usr/local/bin/docker http://crosbymichael.com.s3.amazonaws.com/docker
chmod +x /usr/local/bin/docker

curl -o /etc/supervisor/conf.d/docker.conf https://raw.githubusercontent.com/crosbymichael/.dotfiles/master/docker.conf

supervisorctl reload
