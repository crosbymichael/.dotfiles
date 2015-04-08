#!/bin/bash

set -e 

apt-get update && apt-get install --no-install-recommends -y \
    ca-certificates \
    curl \
    vim-nox \
    git \
    ctags \
    libc6-dev \
    make \
    procps \
    indent \
    man-db \
    tree \
    openssh-client \
    htop \
    clang \
    libclang-dev \
    manpages-dev \
    build-essential \
    mercurial \
    valgrind \
    gdb \
    tig \
    autoconf \
    libtool \
    bison \
    tmux

(
    cd $HOME
    git clone https://github.com/golang/go.git
    cd go/src
    ./make.bash 2>$1
)

cd $HOME

rm -rf $HOME/.vim
ln -s $HOME/.dotfiles/vim $HOME/.vim && ln -s $HOME/.dotfiles/vimrc $HOME/.vimrc 
ln -s $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf 
rm -f $HOME/.gitconfig && ln -s $HOME/.dotfiles/gitconfig $HOME/.gitconfig 
ln -s $HOME/.dotfiles/gitignore_global $HOME/.gitignore_global 
ln -s $HOME/.dotfiles/NERDTreeBookmarks $HOME/.NERDTreeBookmarks 
mkdir -p $HOME/.ssh && ln -s $HOME/.dotfiles/sshconf  $HOME/.ssh/config 
rm -f $HOME/.bashrc && ln -s $HOME/.dotfiles/bashrc $HOME/.bashrc

ln -s $HOME/development/gocode/src/github.com/docker/docker $HOME/docker
ln -s $HOME/development/gocode/src/github.com/docker/libcontainer $HOME/libcontainer
