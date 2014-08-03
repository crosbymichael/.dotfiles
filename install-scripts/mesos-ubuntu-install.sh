#!/bin/bash

set -e 

apt-get install -y curl python-setuptools python-pip python-dev python-protobuf

# zookeeper
apt-get install -y zookeeperd
echo 1 | dd of=/var/lib/zookeeper/myid

# install mesos
curl -fL http://downloads.mesosphere.io/master/ubuntu/14.04/mesos_0.19.0~ubuntu14.04%2B1_amd64.deb -o /tmp/mesos.deb
dpkg -i /tmp/mesos.deb

mkdir -p /etc/mesos-master
echo in_memory | dd of=/etc/mesos-master/registry

## Mesos Python egg for use in authoring frameworks
curl -fL http://downloads.mesosphere.io/master/ubuntu/14.04/mesos-0.19.0_rc2-py2.7-linux-x86_64.egg -o /tmp/mesos.egg
easy_install /tmp/mesos.egg

# marathon
curl -fL http://downloads.mesosphere.io/marathon/marathon_0.5.0-xcon2_noarch.deb -o /tmp/marathon.deb
dpkg -i /tmp/marathon.deb

# deimos
pip install deimos
mkdir -p /etc/mesos-slave

## Configure Deimos as a containerizer
echo /usr/local/bin/deimos | dd of=/etc/mesos-slave/containerizer_path
echo external              | dd of=/etc/mesos-slave/isolation

