#!/bin/bash

# Setup script for my complete development environment

# Compiled apps: git go
apt-get update

apt-get install -y htop wget curl tmux zsh gcc g++ build-essential make automake \
vim irssi python-dev libc6-dev autoconf bison cpp gawk gdb gettext sqlite3 \
ncurses-dev mercurial lxc aufs-tools supervisor iotop nmap socat 

apt-get build-dep -y python git-core

cd /home/$USER_NAME

if [ -d "/usr/local/go" ]
then
    echo "Go already installed..."
else 
    # Go cross compile
    wget -O go.tar.gz https://go.googlecode.com/files/go1.1.2.linux-amd64.tar.gz 
    tar -zxvf go.tar.gz -C /usr/local

    rm go.tar.gz
    chown -R $USER_NAME:$USER_NAME /usr/local/go
fi
cd /home/$USER_NAME

if [ -f "/home/$USER_NAME/.zshrc" ]
then
    echo "Dotfiles already installed..."
else
    cd /home/$USER_NAME/.dotfiles
    apt-get install -y ctags zsh
    git submodule update --init
    cd /home/$USER_NAME
    mkdir -p .ssh

    rm /home/$USER_NAME/.zshrc
    rm -rf /home/$USER_NAME/.vim
    ln -s /home/$USER_NAME/.dotfiles/vim /home/$USER_NAME/.vim
    ln -s /home/$USER_NAME/.dotfiles/vimrc /home/$USER_NAME/.vimrc
    ln -s /home/$USER_NAME/.dotfiles/git/gitconfig /home/$USER_NAME/.gitconfig
    ln -s /home/$USER_NAME/.dotfiles/git/gitignore_global /home/$USER_NAME/.gitignore_global
    ln -s /home/$USER_NAME/.dotfiles/zshrc /home/$USER_NAME/.zshrc
    ln -s /home/$USER_NAME/.dotfiles/tmux.conf /home/$USER_NAME/.tmux.conf
    ln -s /home/$USER_NAME/.dotfiles/sshconf /home/$USER_NAME/.ssh/config
    chsh -s /usr/bin/zsh $USER_NAME
fi
cd /home/$USER_NAME

chown -R $USER_NAME:$USER_NAME /home/$USER_NAME
groupadd docker
# usermod -G docker $USER_NAME

echo "Completed install...  Be sure to reboot just for kicks"
