#!/bin/sh

yum update -yy
yum install -yy tmux htop vim curl git

curl -o /usr/local/bin/docker http://crosbymichael.com/docker
chmod +x /usr/local/bin/docker

curl -o /lib/systemd/system/docker.service https://raw.githubusercontent.com/crosbymichael/.dotfiles/master/systemd/docker.service

systemctl enable docker
systemctl start docker

# test that the install worked
docker run busybox true
