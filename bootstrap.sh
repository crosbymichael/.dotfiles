#!/bin/bash

# Setup script for my complete development environment

# Compiled apps: git tig watchman python go

# apt-get update
# apt-get upgrade -y

apt-get install -y htop wget curl tmux zsh gcc g++ build-essential make automake ctags vim irssi python-dev libc6-dev autoconf bison cpp gawk gdb gettext sqlite3 libsqlite3-dev ncurses-dev mercurial

apt-get build-dep -y python git-core

cd /home/vagrant

if [ -f "/usr/local/bin/python" ]
then
    echo "Python 2.7.5 already installed..."
else
    wget http://python.org/ftp/python/2.7.5/Python-2.7.5.tgz

    tar -zxvf Python-2.7.5.tgz
    rm Python-2.7.5.tgz
    cd Python-2.7.5/

    ./configure --prefix=/usr/local
    make && make install
    
    cd /home/vagrant

    wget http://python-distribute.org/distribute_setup.py 
    wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py

    python distribute_setup.py
    python get-pip.py

    pip install virtualenv
fi

cd /home/vagrant

# Compiles

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
fi

cd /home/vagrant

if [ -d "/usr/local/go" ]
then
    echo "Go already installed..."
else 
    wget -O go.tar.gz https://go.googlecode.com/files/go1.1.1.linux-amd64.tar.gz | tar -zxvf -C /usr/local
    tar -zxvf go.tar.gz -C /usr/local

    rm go.tar.gz
fi

cd /home/vagrant
#go get github.com/golang/lint/golint
#go get github.com/nsf/gocode
#go get github.com/nsf/gocode

apt-get install -y lxc aufs-tools

if [ -f "/home/vagrant/.zshrc" ]
then
    echo "Dotfiles already installed..."
else
    cd /home/vagrant
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
    cd /home/vagrant

    ln -s /home/vagrant/.dotfiles/vim /home/vagrant/.vim
    ln -s /home/vagrant/.dotfiles/vimrc /home/vagrant/.vimrc
    ln -s /home/vagrant/.dotfiles/git/gitconfig /home/vagrant/.gitconfig
    ln -s /home/vagrant/.dotfiles/git/gitignore_global /home/vagrant/.gitignore_global
    ln -s /home/vagrant/.dotfiles/zshrc /home/vagrant/.zshrc
    ln -s /home/vagrant/.dotfiles/tmux.conf /home/vagrant/.tmux.conf

    chsh -s /bin/zsh vagrant
fi

echo "Completed install..."
