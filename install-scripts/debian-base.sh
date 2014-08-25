#!/bin/sh

set -e

apt-get update && apt-get upgrade -y
apt-get install -y tmux htop vim curl git supervisor cgroup-lite

curl -o /usr/local/bin/docker http://crosbymichael.com.s3.amazonaws.com/docker
chmod +x /usr/local/bin/docker

mkdir -p /var/log/docker

curl -o /etc/supervisor/conf.d/docker.conf https://raw.githubusercontent.com/crosbymichael/.dotfiles/master/docker.conf

supervisorctl reload
