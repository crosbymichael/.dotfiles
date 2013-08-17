#!/bin/bash

# Setup script for my complete development environment

# Compiled apps: git tig watchman go

export LC_ALL="UTF8"
apt-get update

apt-get install -y htop wget curl tmux zsh gcc g++ build-essential make automake ctags vim irssi python-dev libc6-dev autoconf bison cpp gawk gdb gettext sqlite3 libsqlite3-dev ncurses-dev mercurial lxc aufs-tools supervisor iotop

apt-get build-dep -y python git-core

cd /home/vagrant

if [ -f "/usr/local/bin/pip" ]
then
    echo "Pip already installed..."
else
    wget http://python-distribute.org/distribute_setup.py 
    wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py

    python distribute_setup.py
    python get-pip.py

    pip install virtualenv
    rm distribute_setup.py
    rm get-pip.py
fi
cd /home/vagrant

if [ -f "/usr/local/bin/git" ]
then
    echo "Git already installed..."
else 
    wget https://git-core.googlecode.com/files/git-1.8.3.4.tar.gz
    tar -zxvf git-1.8.3.4.tar.gz
    rm git-1.8.3.4.tar.gz

    cd git-1.8.3.4/
    ./configure --prefix=/usr/local
    make && make install
    rm -rf git-1.8.3.4/
fi
cd /home/vagrant

if [ -d "/usr/local/go" ]
then
    echo "Go already installed..."
else 
    wget -O go.tar.gz https://go.googlecode.com/files/go1.1.2.linux-amd64.tar.gz 
    tar -zxvf go.tar.gz -C /usr/local

    rm go.tar.gz
    chown -R vagrant:vagrant /usr/local/go
fi
cd /home/vagrant

if [ -f "/home/vagrant/.zshrc" ]
then
    echo "Dotfiles already installed..."
else
    cd /home/vagrant
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
    cd /home/vagrant

    rm /home/vagrant/.zshrc
    ln -s /home/vagrant/.dotfiles/vim /home/vagrant/.vim
    ln -s /home/vagrant/.dotfiles/vimrc /home/vagrant/.vimrc
    ln -s /home/vagrant/.dotfiles/git/gitconfig /home/vagrant/.gitconfig
    ln -s /home/vagrant/.dotfiles/git/gitignore_global /home/vagrant/.gitignore_global
    ln -s /home/vagrant/.dotfiles/zshrc /home/vagrant/.zshrc
    ln -s /home/vagrant/.dotfiles/tmux.conf /home/vagrant/.tmux.conf
    chsh -s /usr/bin/zsh vagrant
fi
cd /home/vagrant

if [ -f "/usr/local/bin/tig" ]
then
    echo "Tig already installed..."
else
    git clone git://github.com/jonas/tig.git
    cd tig
    ./autogen.sh
    ./configure --prefix=/usr/local
    make && make install
fi
cd /home/vagrant

if [ -f "/usr/local/bin/watchman" ]
then 
    echo "Watchman already installed..."
else
    git clone https://github.com/facebook/watchman.git
    cd watchman
    ./autogen.sh
    ./configure --prefix=/usr/local
    automake
fi
cd /home/vagrant

echo "Completed install..."
