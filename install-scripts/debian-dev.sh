#!/bin/sh

set -e 

apt-get install --no-install-recommends -y \
    curl \
    vim \
    git \
    ctags \
    libc6-dev \
    make \
    procps \
    indent \
    man-db \
    tree \
    htop \
    build-essential \
    mercurial \
    pkg-config \
    autoconf \
    bison \
    flex \
    libtool \
    jq \
    tmux

(
    cd /root/
    curl -O https://storage.googleapis.com/golang/go1.3.1.src.tar.gz
    tar -zxvf go1.3.1.src.tar.gz
    cd go/src
    ./make.bash
)

ln -s /root/.dotfiles/vim /root/.vim && ln -s /root/.dotfiles/vimrc /root/.vimrc 
ln -s /root/.dotfiles/tmux.conf /root/.tmux.conf 
ln -s /root/.dotfiles/git/gitconfig /root/.gitconfig 
ln -s /root/.dotfiles/git/gitignore_global /root/.gitignore_global 
ln -s /root/.dotfiles/NERDTreeBookmarks /root/.NERDTreeBookmarks 
mkdir -p /root/.ssh 
ln -s /root/.dotfiles/sshconf  /root/.ssh/config 
ln -s /.dockerinit /usr/local/bin/docker 
rm /root/.bashrc && ln -s /root/.dotfiles/bashrc /root/.bashrc

source /root/.bashrc

/./root/.dotfiles/go-install.sh
