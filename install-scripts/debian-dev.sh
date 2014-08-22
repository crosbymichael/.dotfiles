#!/bin/sh

set -e 

RUN apt-get update && apt-get install --no-install-recommends -y \
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
    tmux

curl -SsL http://golang.org/dl/go1.3.1.src.tar.gz | tar -zxf -c 
(
    cd go/src
    ./all.bash
)

ln -s /root/.dotfiles/vim /root/.vim && ln -s /root/.dotfiles/vimrc /root/.vimrc && \
    ln -s /root/.dotfiles/tmux.conf /root/.tmux.conf && \
    ln -s /root/.dotfiles/git/gitconfig /root/.gitconfig && \
    ln -s /root/.dotfiles/git/gitignore_global /root/.gitignore_global && \
    ln -s /root/.dotfiles/NERDTreeBookmarks /root/.NERDTreeBookmarks && \
    mkdir -p /root/.ssh && \
    ln -s /root/.dotfiles/sshconf  /root/.ssh/config && \
    ln -s /.dockerinit /usr/local/bin/docker && \
    ln -s /usr/src/go /root/go && \
    rm /root/.bashrc && ln -s /root/.dotfiles/bashrc /root/.bashrc

/./root/.dotfiles/go-install.sh
