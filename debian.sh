#!/bin/bash

# make sure this runs on debian jessie
# install systemd
# add this line to grub
#       GRUB_CMDLINE_LINUX_DEFAULT="quiet init=/lib/systemd/systemd"
# run:
#       update-grub

apt-get update && apt-get install -y \
    curl \
    vim \
    git \
    ctags \
    wget \
    libc6-dev \
    autoconf \
    bison \
    cpp \
    gawk \
    gettext \
    libncurses5-dev \
    libbz2-dev \
    libreadline-dev \
    gcc \
    g++ \
    build-essential \
    make \
    automake \
    man-db \
    lxc \
    socat \
    tmux

wget https://go.googlecode.com/files/go1.2.src.tar.gz && tar zxvf go1.2.src.tar.gz && \
	cd go/src && ./all.bash && cd && rm go1.2.src.tar.gz

wget http://fishshell.com/files/2.1.0/fish-2.1.0.tar.gz && tar -zxf fish-2.1.0.tar.gz &&\
	cd fish-2.1.0/ && ./configure --prefix=/usr/local && make && make install &&\
	echo '/usr/local/bin/fish' | tee -a /etc/shells && chsh -s /usr/local/bin/fish &&\
	cd && rm -rf fish-2.1.0 && rm fish-2.1.0.tar.gz

ln -s /root/.dotfiles/vim /root/.vim && ln -s /root/.dotfiles/vimrc /root/.vimrc
mkdir -p /root/.config/fish && ln -s /root/.dotfiles/config.fish /root/.config/fish/config.fish
ln -s /root/.dotfiles/tmux.conf /root/.tmux.conf
ln -s /root/.dotfiles/git/gitconfig /root/.gitconfig
ln -s /root/.dotfiles/git/gitignore_global /root/.gitignore_global
ln -s /root/.dotfiles/NERDTreeBookmarks /root/.NERDTreeBookmarks
mkdir -p /root/.ssh
ln -s /root/.dotfiles/sshconf  /root/.ssh/config

cp /root/.dotfiles/systemd/* /lib/systemd/system/
