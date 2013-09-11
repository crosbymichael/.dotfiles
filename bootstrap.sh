#!/bin/bash

# Setup script for my complete development environment

# Compiled apps: git tig watchman go
apt-get update

apt-get install -y htop wget curl tmux zsh gcc g++ build-essential make automake ctags vim irssi python-dev libc6-dev autoconf bison cpp gawk gdb gettext sqlite3 libsqlite3-dev ncurses-dev mercurial lxc aufs-tools supervisor iotop

apt-get build-dep -y python git-core

cd /home/$USER

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
cd /home/$USER

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
cd /home/$USER

if [ -d "/usr/local/go" ]
then
    echo "Go already installed..."
else 
    wget -O go.tar.gz https://go.googlecode.com/files/go1.1.2.linux-amd64.tar.gz 
    tar -zxvf go.tar.gz -C /usr/local

    rm go.tar.gz
    chown -R $USER:$USER /usr/local/go
fi
cd /home/$USER

if [ -f "/home/$USER/.zshrc" ]
then
    echo "Dotfiles already installed..."
else
    cd /home/$USER
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
    cd /home/$USER

    rm /home/$USER/.zshrc
    ln -s /home/$USER/.dotfiles/vim /home/$USER/.vim
    ln -s /home/$USER/.dotfiles/vimrc /home/$USER/.vimrc
    ln -s /home/$USER/.dotfiles/git/gitconfig /home/$USER/.gitconfig
    ln -s /home/$USER/.dotfiles/git/gitignore_global /home/$USER/.gitignore_global
    ln -s /home/$USER/.dotfiles/zshrc /home/$USER/.zshrc
    ln -s /home/$USER/.dotfiles/tmux.conf /home/$USER/.tmux.conf
    chsh -s /usr/bin/zsh $USER
fi
cd /home/$USER

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
cd /home/$USER

echo "Completed install...  Be sure to reboot just for kicks"
