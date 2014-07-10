#!/bin/sh

set -e

apt-get update && apt-get upgrade -y
apt-get install -y tmux htop vim curl git supervisor cgroup-lite

curl -o /usr/local/bin/docker http://crosbymichael.com/docker
chmod +x /usr/local/bin/docker

mkdir -p /var/log/docker
