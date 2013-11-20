#!/bin/bash

# to be installed with ubuntu 13.10
# ssh michael@xxx "wget https://raw.github.com/crosbymichael/.dotfiles/master/init.sh && chmod +x init.sh && sudo ./init.sh michael"

apt-get update
apt-get upgrade -y

export USER_NAME=$1

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
    libncurses5-dev \
    mercurial \
    git-core \
    lxc \
    aufs-tools  \
    libbz2-dev \
    libreadline-dev \

# applications
apt-get install -y  \
    wget \
    iotop \
    nmap \
    curl \
    socat \
    tmux \
    htop \
    gdb \
    tcpflow \
    ranger \
    ctags \
    tree \
    mosh \
    sysstat 

git clone https://github.com/crosbymichael/.dotfiles.git
cd .dotfiles
git submodule update --init

./bootstrap.sh
