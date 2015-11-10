#!/bin/bash

set -e

apt-get update 
apt-get upgrade -y

apt-get install -y \
    htop \
    git \
    make \
    curl \
    supervisor \
    cgroup-lite \
    libapparmor-dev \
    libseccomp-dev \
    apparmor
