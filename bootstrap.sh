#!/bin/bash

# Setup script for my complete development environment
# Need ruby for a few vim plugins

apt-get update

# infrastructure
apt-get install -y \
    gcc \
    g++ \
    build-essential \
    make \
    automake \
    python \
    python-dev \
    libc6-dev \
    autoconf \
    bison \
    cpp \
    gawk \
    gettext \
    ncurses-dev \
    mercurial \
    #    lxc \
    #    aufs-tools  \
    #    supervisor 
    libbz2-dev \
    libreadline-dev \
    ruby \
    rubygems

# applications
apt-get install -y  \
    wget \
    iotop \
    nmap \
    curl \
    socat \
#   tmux \
#   htop \
#   irssi \
#   gdb \
#   tcpflow \
#   ranger \
#   lynx
#   mutt
    sysstat 

cd /home/$USER_NAME/.dotfiles
./bootstrap.sh

cd /home/$USER_NAME/.dotfiles
./environment.sh

