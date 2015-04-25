#!/bin/bash

set -e

# install system dependencies 
apt-get install -y \
    htop \
    git \
    make \
    curl \
    cgroup-lite \
    libapparmor-dev \
    apparmor

