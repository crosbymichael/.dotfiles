#!/bin/bash

set -e

apt-get update && apt-get upgrade -yy

# install system dependencies 
apt-get install -y \
    htop \
    git \
    make \
    curl \
    cgroup-lite \
    libapparmor-dev \
    apparmor

