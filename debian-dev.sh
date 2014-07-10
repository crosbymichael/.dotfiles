#!/bin/sh

set -e 

apt-get install -y \
    gcc \
    cpp \
    tar \
    make \
    cmake \
    automake \
    autoconf \
    g++ \
    fish \
    strace \
    mercurial \
    tree \
    libsqlite3-dev \
    ctags

chsh -s /usr/bin/fish

ln -s /root/.dotfiles/vim /root/.vim && \
    ln -s /root/.dotfiles/vimrc /root/.vimrc && \
    mkdir -p /root/.config/fish && ln -s /root/.dotfiles/config.fish /root/.config/fish/config.fish && \
    ln -s /root/.dotfiles/tmux.conf /root/.tmux.conf && \
    ln -s /root/.dotfiles/git/gitconfig /root/.gitconfig && \
    ln -s /root/.dotfiles/git/gitignore_global /root/.gitignore_global && \
    ln -s /root/.dotfiles/NERDTreeBookmarks /root/.NERDTreeBookmarks && \
    mkdir -p /root/.ssh && \
    ln -s /root/.dotfiles/sshconf  /root/.ssh/config 

