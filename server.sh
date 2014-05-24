#!/bin/bash

# prod server should be fedora 20 3.14

yum update -yy
yum install -yy htop curl vim

curl -o /usr/local/bin/docker http://crosbymichael.com/docker 

cd /lib/systemd/system
curl -O https://raw.githubusercontent.com/crosbymichael/.dotfiles/master/systemd/docker.service

systemctl enable docker
systemctl start docker

sleep 2

# docker the docker install
docker pull busybox
docker run --rm busybox true
