#!/bin/bash

set -e

# update the host system
function update() {
    apt-get update && apt-get upgrade -yy
}

# install base software and dependencies
function install_base () {
    apt-get install -y \
        apparmor \
        cgroup-lite \
        curl \
        git \
        htop \
        libapparmor-dev \
        libseccomp-dev \
        make \
        mosh \
        tmux 
}

# install additional go deps
function go_deps() {
    go get code.google.com/p/go.tools/cmd/goimports
    go get code.google.com/p/rog-go/exp/cmd/godef
    go get github.com/crosbymichael/gistit
    go get github.com/crosbymichael/slex
    go get github.com/jstemmer/gotags
    go get github.com/monochromegane/the_platinum_searcher 
    go get github.com/nsf/gocode
}

# install development deps and setup vim, bash, and other dotfiles
function install_dev() {
    apt-get install --no-install-recommends -y \
        autoconf \
        bison \
        build-essential \
        ca-certificates \
        clang \
        ctags \
        curl \
        gdb \
        indent \
        libc6-dev \
        libclang-dev \
        libtool \
        make \
        man-db \
        manpages-dev \
        mercurial \
        openssh-client \
        procps \
        tig \
        tree \
        valgrind \
        vim-nox

    # install go
    (
        cd $HOME
        curl -s https://storage.googleapis.com/golang/go1.5.2.linux-amd64.tar.gz | tar -zxf -
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

    # additional home directories
    mkdir $HOME/scratch
}

# main entrypoint

# make sure we have all the submodules downloaded in this directory
git submodules update --init

case "$1" in
    "server")
        echo "installing server dependencies..."
        update
        install_base 
        ;;
    "dev")
        echo "installing development dependencies..."
        update
        install_base
        install_dev
        souce $HOME/.bashrc
        go_deps 
        ;;
    *)
        echo "invalid install option"
        echo "the two options are for a 'server' install and a 'dev' install"
        exit 1
        ;;
esac
