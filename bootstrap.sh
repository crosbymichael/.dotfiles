#!/bin/bash

# Setup script for my complete development environment

# Compiled apps: git tig watchman python go

apt-get update
apt-get upgrade -y

apt-get install -y htop wget curl tmux zsh gcc g++ build-essential make automake ctags vim irssi python-dev libc6-dev autoconf \
bison cpp gawk gdb gettext sqlite3 libsqlite3-dev ncurses ncurses-dev mercurial


# Python deps

wget http://python.org/ftp/python/2.7.5/Python-2.7.5.tgz

tar -zxvf Python-2.7.5.tgz
rm Python-2.7.5.tgz
cd Python-2.7.5/

./configure --prefix=/usr/local

make && make install

wget http://python-distribute.org/distribute_setup.py 
wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py

/usr/local/bin/python distribute_setup.py
/usr/local/bin/python get-pip.py

pip install virtualenv

cd ~/.dotfiles

# Compiles


# Setup git

wget -O git.tar.gz https://git-core.googlecode.com/files/git-1.8.3.4.tar.gz
tar -zxvf git.tar.gz
rm git.tar.gz
cd git
./configure --prefix=/usr/local
make && make install
cd ~/.dotfiles

# Go deps
wget -O go.tar.gz https://go.googlecode.com/files/go1.1.1.linux-amd64.tar.gz | tar -zxvf -C /usr/local
tar -zxvf go.tar.gz -C /usr/local

rm go.tar.gz

#go get github.com/golang/lint/golint
#go get github.com/nsf/gocode
#go get github.com/nsf/gocode

# Docker deps

apt-get install -y lxc aufs-tools

# Install dotfiles
cd ~/
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh
./install.sh

rm install.sh

# Copy dotfiles into home dir
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/gitignore_global ~/.gitignore_global
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf


# Change default shell
chsh -s /bin/zsh vagrant


echo "Completed install..."
