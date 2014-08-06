#!/bin/sh

yum install -yy \
    gcc \
    cpp \
    tar \
    make \
    automake \
    autoconf \
    gcc-c++ \
    fish \
    strace \
    mercurial \
    indent \
    tree \
    libsqlite3x-devel \
    ctags

chsh -s /usr/bin/fish

hg clone -u release https://code.google.com/p/go
(
    cd go/src
    ./make.bash
)

ln -s /root/.dotfiles/vim /root/.vim && \
    ln -s /root/.dotfiles/vimrc /root/.vimrc && \
    mkdir -p /root/.config/fish && ln -s /root/.dotfiles/config.fish /root/.config/fish/config.fish && \
    ln -s /root/.dotfiles/tmux.conf /root/.tmux.conf && \
    ln -s /root/.dotfiles/git/gitconfig /root/.gitconfig && \
    ln -s /root/.dotfiles/git/gitignore_global /root/.gitignore_global && \
    ln -s /root/.dotfiles/NERDTreeBookmarks /root/.NERDTreeBookmarks && \
    mkdir -p /root/.ssh && \
    ln -s /root/.dotfiles/sshconf  /root/.ssh/config && \
    ln -s /usr/lib/golang /root/go

/./root/.dotfiles/go-install.sh

# stupid firewall
systemctl disable firewalld
systemctl stop firewalld
