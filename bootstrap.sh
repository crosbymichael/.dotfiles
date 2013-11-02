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
#    htop \
    wget \
    curl \
#   tmux \
    irssi \
#    gdb \
    iotop \
    nmap \
    socat \
    tcpflow \
#    ranger \
#   lynx
#   mutt
    sysstat 

cd /home/$USER_NAME

if [ -d "/usr/local/bin/vim" ]
then
    echo "Vim already installed..."
else
    hg clone https://vim.googlecode.com/hg/ vim
    cd vim/src
    ./configure --prefix=/usr/local --enable-gui=no --without-x --disable-nls --enable-multibyte --with-tlib=ncurses --enable-pythoninterp --with-features=huge
    make
    make install
fi

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
