#!/bin/bash

# Setup script for my complete development environment
# Need ruby for a few vim plugins

# Compiled apps: git go vim tig
apt-get update

apt-get install -y htop wget curl tmux zsh \
    gcc g++ build-essential make automake \
    irssi python python-dev libc6-dev autoconf \
    bison cpp gawk gdb gettext \
    ncurses-dev mercurial lxc aufs-tools  \
    supervisor iotop nmap socat libbz2-dev \
    libreadline-dev tcpflow ruby rubygems \
    ranger sysstat

cd /home/$USER_NAME

if [ -d "$HOME/go/bin/go" ]
then
    echo "Go already installed..."
else 
    export GOROOT=$HOME/go
    export GOBIN=$GOROOT/bin
    export GOPATH=$HOME/development/gocode
    hg clone https://code.google.com/p/go
    cd go/src/
    ./all.bash
    source ~/.dotfiles/bin/crosscompile.bash
    go-crosscompile-build-all
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

echo "Completed install...  Be sure to reboot just for kicks"
